import 'package:test/test.dart';
import '../src/reverse.dart';

final List<int> input = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
final List<int> result = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1];
late Reverse rev;

Future<void> main() async {
  setUp(() {
    rev = new Reverse();
  });

  await testReverseArray();
  await testReverseString();
  await testReverseNumber();
}

Future<void> testReverseArray() async {
  group('Test ReverseArray', () {
    test('New Array', () async => expect(result, rev.newArray(input)));
    test('Same Array', () async => expect(result, rev.sameArray(input)));
  });
}

Future<void> testReverseString() async {
  group("test ReverseString", () {
    test("newString", () async => expect("9876543210", rev.newString("0123456789")));
  });
}

Future<void> testReverseNumber() async {
  group("test ReverseNumber", () {
    test("newNumber", () async => expect(54321, rev.newNumber(12345)));
  });
}
