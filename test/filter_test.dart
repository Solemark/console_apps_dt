import 'package:test/test.dart';
import '../src/filter.dart';

final List<int> data = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

void main() {
  group("Test evens and odds", () {
    test("Evens", () {
      Filter filter = Filter(data);
      expect([0, 2, 4, 6, 8, 10], filter.even);
    });
    test("Odds", () {
      Filter filter = Filter(data);
      expect([1, 3, 5, 7, 9], filter.odd);
    });
  });
}
