import 'package:test/test.dart';
import 'palindrome.dart';

void main() {
  group("test if palindrome checks string", () {
    test("is DAD a palindrome", () => expect(true, check_palindrome("DAD")));
    test("is Dad a palindrome", () => expect(false, check_palindrome("Dad")));
  });
}
