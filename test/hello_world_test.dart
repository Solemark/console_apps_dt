import 'package:test/test.dart';
import '../src/hello_world.dart';

void main() {
  test('Test hello world', () {
    HelloWorld hw = new HelloWorld();
    expect('Hello world!', hw.greet);
  });
  test('Test hello world', () {
    HelloWorld hw = new HelloWorld("Test");
    expect('Hello Test!', hw.greet);
  });
}
