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
      for ((String, String) data in _testFormatDateDataProvider()) {
        expect(data.$1, d.formatDate(data.$2));
      }
    });
    test("Test getHour", () {
      for ((String, int) data in _testGetHourDataProvider()) {
        expect(data.$1, d.getHour(data.$2));
      }
    });
  });
}

String _getDateTime(DateTime dt) => "${dt.day}/${dt.month}/${dt.year} ${dt.hour}:${dt.minute}:${dt.second}";
List<(String, String)> _testFormatDateDataProvider() => [
      ("20/7/1969 20:18:4", "%d/%m/%Y %H:%i:%s"),
      ("20/7/1969T20:18:4, Sun, Jul, 69, 8pm", "%d/%m/%YT%H:%i:%s, %D, %M, %y, %h"),
    ];
List<(String, int)> _testGetHourDataProvider() => [
      ("12am", 0),
      ("10am", 10),
      ("12pm", 12),
      ("10pm", 22),
    ];
