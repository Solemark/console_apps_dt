import 'package:test/test.dart';
import '../src/hello_world.dart';

late HelloWorld hw;

Future<void> main() async {
  setUp(() {
    hw = new HelloWorld();
  });
  await testHelloWorld();
}

Future<void> testHelloWorld() async {
  group("Test hello world", () {
    test("default", () async {
      expect('Hello world!', hw.greet());
    });
    test("'Test'", () async {
      hw.name = "Test";
      expect('Hello Test!', hw.greet());
    });
  });
}
