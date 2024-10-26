import 'dart:math';

String gachaRoll(String game) {
  switch (game) {
    case "FGO":
      return _play(100, 300, 5, game);
    case "AK":
      return _play(50, 100, 6, game);
    case "GI":
      return _play(60, 90, 5, game);
    default:
      return "Unknown game";
  }
}

String _play(int rate, int pity, int rarity, String game) {
  int rolls = 1;
  while (true) {
    if (rolls == pity) return "You hit pity at $rolls rolls for your $rarity in $game";
    if (Random().nextInt(rate + 1) == rate) return "It took $rolls rolls to get a $rarity in $game";
  }
}
