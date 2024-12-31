import 'dart:math';

enum Game { fgo, ak, gi }

class GachaRoll {
  Game game;
  late int rate, pity, rarity;

  GachaRoll(this.game) {
    switch (game) {
      case Game.fgo:
        this.rate = 100;
        this.pity = 300;
        this.rarity = 5;
      case Game.ak:
        this.rate = 50;
        this.pity = 100;
        this.rarity = 6;
      case Game.gi:
        this.rate = 60;
        this.pity = 90;
        this.rarity = 5;
    }
  }

  String get play {
    int rolls = 1;
    while (true) {
      if (rolls == this.pity) return "You hit pity at $rolls rolls for your ${this.rarity} in ${this.game.name}";
      if (Random().nextInt(this.rate + 1) == this.rate)
        return "It took $rolls rolls to get a ${this.rarity} in ${this.game.name}";
    }
  }
}
