import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';

class CsvUtils {
  static Future<void> exportToCsv(List<List<dynamic>> data) async {
    try {
      String csv = const ListToCsvConverter().convert(data);

      Uint8List bytes = Uint8List.fromList(utf8.encode(csv));

      String? outputFile = await FilePicker.platform.saveFile(
        dialogTitle: 'Enregistrer le fichier CSV',
        fileName: 'exported_consumption.csv',
        type: FileType.custom,
        allowedExtensions: ['csv'],
        bytes: bytes,
      );

      if (outputFile == null) {
        throw Exception('Export annulé par l\'utilisateur');
      }
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
        final fields = await input
            .transform(utf8.decoder)
            .transform(const CsvToListConverter())
            .toList();
        return fields;
      } else {
        throw Exception('Invalid selection');
      }
    } catch (e) {
      rethrow;
    }
  }
}
