import 'dart:math';

class Circles {
  num radius;
  Circles(this.radius);
  num get area => this.radius <= 0 ? 0 : pi * pow(this.radius, 2);
  num get circ => this.radius <= 0 ? 0 : 2 * pi * this.radius;
}
