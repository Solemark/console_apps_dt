import 'dart:math';

num area(num radius) => radius <= 0 ? 0 : pi * pow(radius, 2);
num circ(num radius) => radius <= 0 ? 0 : 2 * pi * radius;
