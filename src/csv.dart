import 'dart:io';
import 'package:csv/csv.dart';

class CSV {
  String filename;
  List<List<String>> data;
  CSV(this.filename, this.data);
  Future<void> write() async => await File("${this.filename}").writeAsString(ListToCsvConverter().convert(this.data));
  Future<void> destroy() async => await File("${this.filename}").delete();
}
