import 'dart:io';
import 'package:csv/csv.dart';

Future<void> write_csv(String filename, List<List<String>> data) async =>
    await File('${filename}').writeAsString(ListToCsvConverter().convert(data));

Future<void> destroy_csv(String filename) async => await File('${filename}').delete();
