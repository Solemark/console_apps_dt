import 'package:test/test.dart';
import '../src/palindrome.dart';

void main() {
  group("test if palindrome checks string", () {
    test("is DAD a palindrome", () => expect(true, Palindrome("DAD").check));
    test("is Dad a palindrome", () => expect(false, Palindrome("Dad").check));
  });
}
