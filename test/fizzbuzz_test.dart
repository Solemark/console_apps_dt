import 'package:test/test.dart';
import '../src/fizzbuzz.dart';

void main() {
  late String exp;
  late FizzBuzz fb;

  setUp(() {
    exp = "1\n2\nfizz\n4\nbuzz\nfizz\n7\n8\nfizz\nbuzz\n11\nfizz\n13\n14\nfizzbuzz\n16\n17\nfizz\n19\nbuzz";
    fb = FizzBuzz(fizz: 3, buzz: 5, max: 20);
  });

  group("Test FizzBuzz", () {
    test("play()", () {
      String res = fb.play();
      expect(exp, res);
    });
    test("play2()", () {
      String res = fb.play2();
      expect(exp, res);
    });
    test("checkConditions()", () {
      String str = "1\n2\nfizz\n4\nbuzz\nfizz\n7\n8\nfizz\nbuzz\n11\nfizz\n13\n14\n";
      String exp = "${str}fizzbuzz\n";
      String res = fb.checkConditions(15, str);
      expect(exp, res);
    });
  });
}
