import 'package:test/test.dart';
import '../src/calculator.dart';

void main() {
  const Iterable<(num, num)> data = [
    (5.5, 5.5),
    (5.5, -5.5),
    (-5.5, -5.5),
  ];
  group('test calculator', () {
    test('addition', () {
      for ((num, num) row in data) {
        Calculator calc = Calculator(row.$1, row.$2);
        expect(row.$1 + row.$2, calc.add);
      }
    });

    test('subtraction', () {
      for ((num, num) row in data) {
        Calculator calc = Calculator(row.$1, row.$2);
        expect(row.$1 - row.$2, calc.sub);
      }
    });
    test('multiplication', () {
      for ((num, num) row in data) {
        Calculator calc = Calculator(row.$1, row.$2);
        expect(row.$1 * row.$2, calc.mul);
      }
    });
    test('division', () {
      for ((num, num) row in data) {
        Calculator calc = Calculator(row.$1, row.$2);
        expect(row.$1 / row.$2, calc.div);
      }
    });
  });
}
