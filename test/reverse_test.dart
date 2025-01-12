import 'package:test/test.dart';
import '../src/reverse.dart';

Future<void> main() async {
  await testReverseArray();
}

Future<void> testReverseArray() async {
  group('Test Reverse', () {
    final List<int> input = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    final List<int> result = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1];
    test('New Array', () async => expect(result, Reverse(input).narr()));
    test('Same Array', () async => expect(result, Reverse(input).sarr()));
  });
}
