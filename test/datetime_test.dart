import 'package:test/test.dart';
import '../src/datetime.dart';

void main() {
  test('Test current datetime', () {
    Date d = Date();
    DateTime dt = DateTime.now();
    expect("${dt.day}/${dt.month}/${dt.year}", d.current);
  });
}
