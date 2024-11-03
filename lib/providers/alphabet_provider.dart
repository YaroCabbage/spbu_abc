import 'package:abc_sbpu_project/utils/image_excel_extractor.dart';
import 'package:archive/archive.dart';
import 'package:excel/excel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:math';
import '../models/alphabet_entry.dart';

// final alphabetProvider = FutureProvider<List<AlphabetEntry>>((ref) async {
//   final assets = [
//     'assets/data/alphabet1.json',
//     'assets/data/alphabet2.json',
//     // Add more asset paths as needed
//   ];
//
//   List<AlphabetEntry> allEntries = [];
//
//   for (final asset in assets) {
//     final jsonString = await rootBundle.loadString(asset);
//     final List<dynamic> jsonList = json.decode(jsonString);
//     final entries = jsonList.map((json) => AlphabetEntry.fromJson({
//       'letter': json['Буква'],
//       'concept': json['Понятие / словосочетание'],
//       'source': json['Источник'],
//       'definition': json['Определение своими словами'],
//       'usage': json['Ситуации, в которой потребуется обращение к этому понятию'],
//       'visualImage': json['Визуальный образ'],
//     })).toList();
//     allEntries.addAll(entries);
//   }
//
//   // Randomly shuffle the entries
//   allEntries.shuffle(Random());
//   return allEntries;
// });

final alphabetProvider = FutureProvider<List<AlphabetEntry>>((ref) async {
  final assets = [
    'assets/data/alphabet_iaro.xlsx',
    // Add more Excel files if needed
  ];

  List<AlphabetEntry> allEntries = [];

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

          allEntries.add(AlphabetEntry(
            letter: letter,
            concept: concept,
            source: source,
            definition: definition,
            usage: usage,
            imageData: imageData,
          ));
        } catch (e) {
          print('Error processing row $row: $e');
          continue;
        }
      }
    }
  }

  // Randomly shuffle the entries
  // allEntries.shuffle(Random());
  return allEntries;
});
