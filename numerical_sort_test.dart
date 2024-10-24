import 'package:test/test.dart';
import 'numerical_sort.dart';

void main() {
  List<double> expected = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<double> input = [10, 8, 7, 9, 5, 1, 0, 3, 2, 6, 4];
  test('Sort array numerically', () => expect(expected, numerical_sort(input)));
}
