import 'package:test/test.dart';
import '../src/gacha_roll.dart';

List<String> getData() => ['FGO', 'AK', 'GI'];

void main() {
  test('Test gacha roll', () {
    List<String> data = getData();
    for (String item in data) {
      expect(true, gachaRoll(item).contains(item));
    }
  });
}