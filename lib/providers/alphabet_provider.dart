import 'dart:math';

import 'package:abc_sbpu_project/models/alphabet_entry.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final r = Random();
final alphabetProvider = FutureProvider<List<AlphabetEntry>>((ref) async {
  final assets = [
    'assets/data/alphabet_iaro.xlsx',
    'assets/data/alphabet_ira.xlsx',
    'assets/data/alphabet_ksenia.xlsx',
    'assets/data/alphabet_men.xlsx',
    // Add more Excel files if needed
  ];

  List<AlphabetEntry> allEntries = [];
  final mapEntries = <String, AlphabetEntry>{};
  final chosenL = List.generate(33, (_) => r.nextInt(assets.length));
  var assetIndex = 0;

  for (final asset in assets) {
    final bytes = await rootBundle.load(asset);
    final excel = Excel.decodeBytes(bytes.buffer.asUint8List());

    for (final sheet in excel.tables.keys) {
      final currentSheet = excel.tables[sheet]!;

      // Skip header row
      for (var row = 1; row < currentSheet.maxRows; row++) {
        try {
          final letter = currentSheet
                  .cell(
                      CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: row))
                  .value
                  ?.toString() ??
              '';

          if (letter.isEmpty) continue; // Skip empty rows

          final concept = currentSheet
                  .cell(
                      CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: row))
                  .value
                  ?.toString() ??
              '';

          final source = currentSheet
                  .cell(
                      CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: row))
                  .value
                  ?.toString() ??
              '';

          final definition = currentSheet
                  .cell(
                      CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: row))
                  .value
                  ?.toString() ??
              '';

          final usage = currentSheet
                  .cell(
                      CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: row))
                  .value
                  ?.toString() ??
              '';

          // Extract image from the Excel file
          final imageCell = currentSheet
              .cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: row))
              .value;

          final imageData =
              imageCell is ImageCellValue ? imageCell.value : null;

          final newLetter = AlphabetEntry(
            letter: letter,
            concept: concept,
            source: source,
            definition: definition,
            usage: usage,
            imageData: imageData,
          );

          mapEntries[letter] ??= newLetter;
          final index = row - 1;
          final chosenIndex = chosenL[index];
          if (chosenIndex == assetIndex) {
            mapEntries[letter] = newLetter;
          }
        } catch (e) {
          print('Error processing row $row: $e');
          continue;
        }
      }
    }
    assetIndex++;
  }

  return mapEntries.values.toList();
});
