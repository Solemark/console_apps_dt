import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:test/test.dart';
import '../src/csv.dart';

void main() {
  const String filename = "test.csv";
  const List<List<String>> data = [
    ["Header 1", "Header 2", "Header 3"],
    ["Data 1-1", "Data 2-1", "Data 3-1"],
    ["Data 1-2", "Data 2-2", "Data 3-2"]
  ];

  setUp(() async {
    writeCSV(filename, data);
  });

  tearDown(() async {
    await destroyCSV(filename);
  });

  group('Test Write to CSV', () {
    test('Test Filename Exists', () async => expect(true, await File("$filename").exists()));
    test(
        'Test File Has Data',
        () async => expect(data,
            await File('${filename}').openRead().transform(utf8.decoder).transform(CsvToListConverter()).toList()));
  });
}
