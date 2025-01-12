import 'package:test/test.dart';
import '../src/filter.dart';

const List<int> data = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

Future<void> main() async {
  await testEvens();
  await testOdds();
}

Future<void> testEvens() async {
  test("Evens", () async {
    Filter filter = Filter(data);
    expect([0, 2, 4, 6, 8, 10], filter.even);
  });
}

Future<void> testOdds() async {
  test("Odds", () async {
    Filter filter = Filter(data);
    expect([1, 3, 5, 7, 9], filter.odd);
  });
}
