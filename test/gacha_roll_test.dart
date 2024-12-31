import 'package:test/test.dart';
import '../src/gacha_roll.dart';

final List<Game> data = [Game.fgo, Game.ak, Game.gi];

void main() {
  test('Test gacha roll', () {
    for (Game item in data) {
      GachaRoll gr = new GachaRoll(item);
      expect(true, gr.play.contains(item.name));
    }
  });
}
