import 'package:test/test.dart';
import 'datetime.dart';

void main() {
  test('Test current datetime', () {
    int day = DateTime.now().day;
    int month = DateTime.now().month;
    int year = DateTime.now().year;
    expect('$day/$month/$year', current());
  });
}
