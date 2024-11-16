import 'package:test/test.dart';
import '../src/fizzbuzz.dart';

void main() {
  test('Test fizzbuzz', () {
    String exp = "1\n2\nfizz\n4\nbuzz\nfizz\n7\n8\nfizz\nbuzz\n11\nfizz\n13\n14\nfizzbuzz\n16\n17\nfizz\n19\nbuzz";
    String res = FizzBuzz(3, 5, 20).play();
    expect(exp, res);
  });
}
