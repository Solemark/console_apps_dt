import 'package:test/test.dart';
import 'hello_world.dart';

void main() {
  test('Test hello world', () => expect('Hello world!', hello_world()));
  test('Test hello world', () => expect('Hello Test!', hello_world("Test")));
}
