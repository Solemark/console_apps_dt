import 'package:test/test.dart';
import '../src/background_worker.dart';

final String data = "{\"1\":\"one\",\"2\":\"two\",\"3\":\"three\"}";
late BackgroundWorker bw;
Future<void> main() async {
  setUp(() async {
    bw = new BackgroundWorker(data);
  });

  group("Test BackgroundWorker", () {
    test("BackgroundWorker.run()", () async {
      final res = await bw.run();
      expect(3, res.length);
    });
  });
}
