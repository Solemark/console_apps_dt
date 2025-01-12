import 'package:test/test.dart';
import '../src/calculator.dart';

const Iterable<(num, num)> data = [
  (5.5, 5.5),
  (5.5, -5.5),
  (-5.5, -5.5),
];

Future<void> main() async {
  await testAddition();
  await testSubtraction();
  await testMultiplication();
  await testDivision();
}

Future<void> testAddition() async {
  test('Test addition', () async {
    for ((num, num) row in data) {
      Calculator calc = Calculator(row.$1, row.$2);
      expect(row.$1 + row.$2, calc.add);
    }
  });
}

Future<void> testSubtraction() async {
  test('Test subtraction', () async {
    for ((num, num) row in data) {
      Calculator calc = Calculator(row.$1, row.$2);
      expect(row.$1 - row.$2, calc.sub);
    }
  });
}

Future<void> testMultiplication() async {
  test('Test multiplication', () async {
    for ((num, num) row in data) {
      Calculator calc = Calculator(row.$1, row.$2);
      expect(row.$1 * row.$2, calc.mul);
    }
  });
}

Future<void> testDivision() async {
  test('Test division', () async {
    for ((num, num) row in data) {
      Calculator calc = Calculator(row.$1, row.$2);
      expect(row.$1 / row.$2, calc.div);
    }
  });
}
