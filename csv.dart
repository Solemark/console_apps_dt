import 'dart:io';
import 'package:csv/csv.dart';

Future<void> writeCSV(String filename, List<List<String>> data) async {
  await File('${filename}').writeAsString(ListToCsvConverter().convert(data));
}

Future<void> destroyCSV(String filename) async {
  await File('${filename}').delete();
}
