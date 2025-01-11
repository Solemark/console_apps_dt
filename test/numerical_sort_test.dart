import 'package:test/test.dart';
import '../src/numerical_sort.dart';

void main() {
  late List<double> exp;
  late List<double> inp;
  setUp(() {
    exp = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    inp = [10, 8, 7, 9, 5, 1, 0, 3, 2, 6, 4];
  });
  group("Test NumericalSort", () {
    test('Sort array with numSort()', () => expect(exp, NumericalSort(inp).numSort()));
  });
}
