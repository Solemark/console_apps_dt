import 'dart:math';

num calc_area(num radius) => radius <= 0 ? 0 : pi * pow(radius, 2);
num calc_circ(num radius) => radius <= 0 ? 0 : 2 * pi * radius;
