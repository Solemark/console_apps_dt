import 'dart:io';
import 'package:csv/csv.dart';

class CSV {
  String filename;
  List<List<String>> data;
  CSV(this.filename, this.data);
  Future<void> write() async => await File("${this.filename}").writeAsString(ListToCsvConverter().convert(this.data));
  Future<void> destroy([int i = 0]) async {
    File f = File("${this.filename}");
    await f.delete();
    if (await f.exists() && i < 3) await this.destroy(i + 1); // if file still exists try again, max 3 attempts
  }
}
