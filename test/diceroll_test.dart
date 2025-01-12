import 'package:test/test.dart';
import '../src/diceroll.dart';

const List<int> data = [4, 6, 8, 10, 12, 20];

Future<bool> isBetween(int max) async {
  int number = Roll(max).roll;
  return (number <= max && number > 0) ? true : false;
}

Future<void> main() async {
  await testDiceRoll();
}

Future<void> testDiceRoll() async {
  test('Test dice roll', () async {
    for (int max in data) {
      expect(true, await isBetween(max));
    }
  });
}
