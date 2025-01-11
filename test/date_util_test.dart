import 'package:test/test.dart';
import '../src/date_util.dart';

final int TIME = 50;
final String DATE_FORMAT = "%d/%m/%Y %H:%i:%s";

late DateUtil d;
late DateTime dt;

void main() {
  setUp(() {
    dt = DateTime(1969, 07, 20, 20, 18, 04);
    d = DateUtil(dt);
  });

  group("Test DateUtil", () {
    test("Test addDays", () {
      d.addDays(TIME);
      dt = dt.add(Duration(days: TIME));
      expect(_getDateTime(dt), d.formatDate(DATE_FORMAT));
    });
    test("Test subDays", () {
      d.subDays(TIME);
      dt = dt.subtract(Duration(days: TIME));
      expect(_getDateTime(dt), d.formatDate(DATE_FORMAT));
    });
    test("Test addHours", () {
      d.addHours(TIME);
      dt = dt.add(Duration(hours: TIME));
      expect(_getDateTime(dt), d.formatDate(DATE_FORMAT));
    });
    test("Test subHours", () {
      d.subHours(TIME);
      dt = dt.subtract(Duration(hours: TIME));
      expect(_getDateTime(dt), d.formatDate(DATE_FORMAT));
    });
    test("Test addSeconds", () {
      d.addSeconds(TIME);
      dt = dt.add(Duration(seconds: TIME));
      expect(_getDateTime(dt), d.formatDate(DATE_FORMAT));
    });
    test("Test subSeconds", () {
      d.subSeconds(TIME);
      dt = dt.subtract(Duration(seconds: TIME));
      expect(_getDateTime(dt), d.formatDate(DATE_FORMAT));
    });
    test("Test setDate", () {
      dt = dt.add(Duration(days: TIME));
      d.setDateTime(dt);
      expect(_getDateTime(dt), d.formatDate(DATE_FORMAT));
    });
    test("Test diffDates", () => expect(TIME, d.diff(dt.add(Duration(days: TIME))).inDays.abs()));
    test("Test formatDate", () {
      String exp = "20/7/1969T20:18:4, Sun, Jul, 69, 8pm";
      String res = d.formatDate("%d/%m/%YT%H:%i:%s, %D, %M, %y, %h");
      expect(exp, res);
    });
    test("Test getHour", () {
      for ((String, DateTime) data in _testGetHourDataProvider()) {
        d.setDateTime(data.$2);
        expect(data.$1, d.formatDate("%h"));
      }
    });
  });
}

String _getDateTime(DateTime dt) => "${dt.day}/${dt.month}/${dt.year} ${dt.hour}:${dt.minute}:${dt.second}";
List<(String, DateTime)> _testGetHourDataProvider() => [
      ("12am", DateTime(2020, 2, 1, 0, 0, 0)),
      ("10am", DateTime(2020, 2, 1, 10, 0, 0)),
      ("12pm", DateTime(2020, 2, 1, 12, 0, 0)),
      ("10pm", DateTime(2020, 2, 1, 22, 0, 0)),
    ];
