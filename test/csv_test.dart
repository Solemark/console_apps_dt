import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:test/test.dart';
import '../src/csv.dart';

const String filename = "test.csv";
const List<List<String>> data = [
  ["Header 1", "Header 2", "Header 3"],
  ["Data 1-1", "Data 2-1", "Data 3-1"],
  ["Data 1-2", "Data 2-2", "Data 3-2"]
];

late CSV csv;

Future<void> cleanup() async {
  csv.destroy();
}

Future<void> main() async {
  setUp(() async {
    csv = CSV(filename, data);
    csv.write();
  });

  await testFileExists();
  await testFileHasData();
  await testFileDestroyed();
}

Future<void> testFileExists() async {
  test('Test File Exists', () async {
    expect(true, await File("$filename").exists());
    cleanup();
  });
}

Future<void> testFileHasData() async {
  test('Test File Has Data', () async {
    expect(data, await File('${filename}').openRead().transform(utf8.decoder).transform(CsvToListConverter()).toList());
  });
}

Future<void> testFileDestroyed() async {
  test("Test file was destroyed", () async {
    CSV(filename, data).destroy();
    expect(false, await File("$filename").exists());
  });
}
