import 'package:test/test.dart';
import '../src/circles.dart';

void main() {
  const Iterable<(num, num)> area_data = [
    (0, -5),
    (0, 0),
    (78.53981633974483, 5),
  ];
  const Iterable<(num, num)> circ_data = [
    (0, -5),
    (0, 0),
    (31.41592653589793, 5),
  ];
  group('test circles', () {
    test('area', () {
      for ((num, num) row in area_data) {
        Circles c = Circles(row.$2);
        expect(row.$1, c.area);
      }
    });
    test('circumference', () {
      for ((num, num) row in circ_data) {
        Circles c = Circles(row.$2);
        expect(row.$1, c.circ);
      }
    });
  });
}
