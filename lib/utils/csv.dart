import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:external_path/external_path.dart';
import 'package:file_picker/file_picker.dart';

class CsvUtils {
  static Future<void> exportToCsv(List<List<dynamic>> data) async {
    try {
      final downloadPath =
          await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOAD);

      final filePath = '$downloadPath/exported_consumption.csv';

      String csv = const ListToCsvConverter().convert(data);

      final File file = File(filePath);
      await file.writeAsString(csv);
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<List<dynamic>>> importFromCsv() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv'],
      );

      if (result != null) {
        File file = File(result.files.single.path!);
        final input = file.openRead();
        final fields =
            await input.transform(utf8.decoder).transform(const CsvToListConverter()).toList();
        return fields;
      } else {
        throw Exception('Invalid selection');
      }
    } catch (e) {
      rethrow;
    }
  }
}
