import 'package:test/test.dart';
import '../src/gacha_roll.dart';

final List<Game> data = [Game.fgo, Game.ak, Game.gi];

Future<void> main() async {
  await testGachaRoll();
}

Future<void> testGachaRoll() async {
  test('Test gacha roll', () async {
    for (Game item in data) {
      GachaRoll gr = new GachaRoll(item);
      expect(true, gr.play().contains(item.name));
    }
  });
}
