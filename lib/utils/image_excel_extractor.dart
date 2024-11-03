import 'package:archive/src/archive.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';

class ExcelImageExtractor {
  static Future<Uint8List?> extractImage(
    Sheet sheet,
    int row,
    int col,
  ) async {
    try {
      // Try to get image from cell
      final cell = sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: col, rowIndex: row));

      // Check if cell has an image
      if (cell.value != null) {
        // Handle different types of image storage in Excel

        // 1. If image is stored as a reference to external file
        if (cell.value is String &&
            (cell.value as String).startsWith('assets/')) {
          final imagePath = cell.value as String;
          return await rootBundle
              .load(imagePath)
              .then((data) => data.buffer.asUint8List());
        }

        // 2. If image is embedded in Excel (might need adjustment based on actual Excel structure)
        print(cell.value);
        final image = cell.value as Uint8List;
        return image;
        // if (images != null && images.isNotEmpty) {
        //   for (var image in images) {
        //     // Check if image belongs to this cell (implementation depends on Excel structure)
        //     if (image.anchorCell?.row == row && image.anchorCell?.col == col) {
        //       return image.bytes;
        //     }
        //   }
        // }
      }
      return null;
    } catch (e) {
      print('Error extracting image: $e');
      return null;
    }
  }
}
