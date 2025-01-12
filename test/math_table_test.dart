import 'package:test/test.dart';
import '../src/math_table.dart';

late MathTable mt;

Future<void> main() async {
  setUp(() {
    mt = MathTable(1, 12);
  });
  await testCalculate();
  await testStringify();
}

Future<void> testCalculate() async {
  group("test calculate()", () {
    test("1x table", () {
      Iterable<num> exp = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
      expect(exp, mt.calculate());
    });
    test("12x table", () async {
      mt.table = 12;
      Iterable<num> exp = [0, 12, 24, 36, 48, 60, 72, 84, 96, 108, 120, 132, 144];
      expect(exp, mt.calculate());
    });
  });
}

Future<void> testStringify() async {
  group("test stringify()", () {
    test("1x table", () async {
      Iterable<String> exp = [
        '1 x 0 = 0',
        '1 x 1 = 1',
        '1 x 2 = 2',
        '1 x 3 = 3',
        '1 x 4 = 4',
        '1 x 5 = 5',
        '1 x 6 = 6',
        '1 x 7 = 7',
        '1 x 8 = 8',
        '1 x 9 = 9',
        '1 x 10 = 10',
        '1 x 11 = 11',
        '1 x 12 = 12'
      ];
      expect(exp, mt.stringify());
    });
    test("12x table", () async {
      mt.table = 12;
      Iterable<String> exp = [
        '12 x 0 = 0',
        '12 x 1 = 12',
        '12 x 2 = 24',
        '12 x 3 = 36',
        '12 x 4 = 48',
        '12 x 5 = 60',
        '12 x 6 = 72',
        '12 x 7 = 84',
        '12 x 8 = 96',
        '12 x 9 = 108',
        '12 x 10 = 120',
        '12 x 11 = 132',
        '12 x 12 = 144'
      ];
      expect(exp, mt.stringify());
    });
  });
}
