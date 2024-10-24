import 'dart:math';

String gacha_roll(String game) {
  String output = "Unknown Game!";
  if (game == "FGO") output = _play(100, 300, 5, game);
  if (game == "AK") output = _play(50, 100, 6, game);
  if (game == "GI") output = _play(60, 90, 5, game);
  return output;
}

String _play(int rate, int pity, int rarity, String game) {
  int rolls = 1;
  while (true) {
    if (rolls == pity) return "You hit pity at $rolls rolls for your $rarity in $game";
    if (Random().nextInt(rate + 1) == rate) return "It took $rolls rolls to get a $rarity in $game";
  }
}
