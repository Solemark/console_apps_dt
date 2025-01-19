import 'dart:convert';
import 'dart:isolate';

class BackgroundWorker {
  String data;
  BackgroundWorker(this.data);

  /**
   * Simple Concurrency Example using, function wrapped in Isolate.run()
   * Isolate functions cannot be passed data statically
   * ```dart
   * final <Map<String, dynamic>> d = await Isolate.run(_readAndParseJson);
   * print(d.length); // number of elements in json blob
   * ```
   */
  Future<Map<String, dynamic>> run() async {
    Map<String, dynamic> res = await Isolate.run(_runParseJson);
    return res;
  }

  Future<Map<String, dynamic>> _runParseJson() async => jsonDecode(this.data) as Map<String, dynamic>;

  /**
   * Simple Concurrency Example using sender & receiver with Isolate.spawn()
   * Isolate functions cannot be passed data statically
   * ```dart
   * final rp = ReceivePort();
   * await Isolate.spawn(_readAndParseJson2, rp.sendPort);
   * rp.listen((e) => print(e.length)); // number of elements in json blob
   * rp.close();
   * ```
   */
  Future<void> spawn() async {
    final ReceivePort rp = ReceivePort();
    await Isolate.spawn(_runParseJson2, rp.sendPort);
    rp.listen((m) {
      print(m);
      rp.close();
    });
  }

  Future<void> _runParseJson2(SendPort sp) async => sp.send(await _runParseJson());
}

void main() async => new BackgroundWorker("{\"1\":\"one\",\"2\":\"two\",\"3\":\"three\"}").spawn();
