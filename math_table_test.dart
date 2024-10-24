import 'package:test/test.dart';
import 'math_table.dart';

void main() {
  group("test multiplication tables", () {
    test("get 1 times table", () {
      expect([
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
      ], get_table(12, 12));
    });
    test("get 12 times table", () {
      expect([
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
      ], get_table(1, 12));
    });
  });
}
