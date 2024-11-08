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
        expect(row.$1 + row.$2, add(row.$1, row.$2));
      }
    });

    test('subtraction', () {
      for ((num, num) row in data) {
        expect(row.$1 - row.$2, sub(row.$1, row.$2));
      }
    });
    test('multiplication', () {
      for ((num, num) row in data) {
        expect(row.$1 * row.$2, mul(row.$1, row.$2));
      }
    });
    test('division', () {
      for ((num, num) row in data) {
        expect(row.$1 / row.$2, div(row.$1, row.$2));
      }
    });
  });
}
