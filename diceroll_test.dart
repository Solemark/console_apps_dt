import 'package:test/test.dart';
import 'diceroll.dart';

List<int> getData() => [4, 6, 8, 10, 12, 20];

bool isBetween(int max) {
  int number = get_roll(max);
  return (number <= max && number > 0) ? true : false;
}

void main() {
  List<int> data = getData();
  test('Test dice roll', () {
    for (int max in data) {
      expect(true, isBetween(max));
    }
  });
}
