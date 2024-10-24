import 'package:test/test.dart';
import 'filter.dart';

List<int> getData() => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

void main() {
  group("Test evens and odds", () {
    test("Evens", () => expect([0, 2, 4, 6, 8, 10], get_evens(getData())));
    test("Odds", () => expect([1, 3, 5, 7, 9], get_odds(getData())));
  });
}
