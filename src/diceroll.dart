import 'dart:math';

class Roll {
  int max;
  Roll(this.max);
  int get roll => Random().nextInt(this.max) + 1;
}
