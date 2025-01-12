import 'package:test/test.dart';
import '../src/fizzbuzz.dart';

late FizzBuzz fb;
const String exp = "1\n2\nfizz\n4\nbuzz\nfizz\n7\n8\nfizz\nbuzz\n11\nfizz\n13\n14\nfizzbuzz\n16\n17\nfizz\n19\nbuzz";

Future<void> main() async {
  setUp(() {
    fb = FizzBuzz(fizz: 3, buzz: 5, max: 20);
  });

  await testPlay();
  await testPlay2();
  await testCheckConditions();
}

Future<void> testPlay() async {
  test("play()", () async {
    String res = fb.play();
    expect(exp, res);
  });
}

Future<void> testPlay2() async {
  test("play2()", () async {
    String res = fb.play2();
    expect(exp, res);
  });
}

Future<void> testCheckConditions() async {
  test("checkConditions()", () async {
    String str = "1\n2\nfizz\n4\nbuzz\nfizz\n7\n8\nfizz\nbuzz\n11\nfizz\n13\n14\n";
    String exp = "${str}fizzbuzz\n";
    String res = fb.checkConditions(15, str);
    expect(exp, res);
  });
}
