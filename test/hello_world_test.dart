import 'package:test/test.dart';
import '../src/hello_world.dart';

void main() {
  late HelloWorld hw;
  setUp(() {
    hw = new HelloWorld();
  });
  test('Test hello world', () {
    expect('Hello world!', hw.greet);
  });
  test('Test hello world', () {
    hw.name = "Test";
    expect('Hello Test!', hw.greet);
  });
}
