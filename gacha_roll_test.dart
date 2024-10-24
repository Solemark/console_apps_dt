import 'package:test/test.dart';
import 'gacha_roll.dart';

List<String> getData() => ['FGO', 'AK', 'GI'];

void main() {
  test('Test gacha roll', () {
    List<String> data = getData();
    for (String item in data) {
      expect(true, gacha_roll(item).contains(item));
    }
  });
}
