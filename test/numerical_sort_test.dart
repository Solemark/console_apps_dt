import 'package:test/test.dart';
import '../src/numerical_sort.dart';

Future<void> main() async {
  await testNumSort();
}

Future<void> testNumSort() async {
  final List<double> exp = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final List<double> inp = [10, 8, 7, 9, 5, 1, 0, 3, 2, 6, 4];
  test('Sort numSort()', () async => expect(exp, NumericalSort(inp).numSort()));
}
