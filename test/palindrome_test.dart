import 'package:test/test.dart';
import '../src/palindrome.dart';

Future<void> main() async {
  await testPalindromeCheck();
}

Future<void> testPalindromeCheck() async {
  group("Test Palindrome.check()", () {
    test("DAD is palindrome", () async => expect(true, Palindrome("DAD").check()));
    test("Dad isn't palindrome", () async => expect(false, Palindrome("Dad").check()));
  });
}
