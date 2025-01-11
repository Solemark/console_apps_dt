import 'package:test/test.dart';
import '../src/date_util.dart';

// Constants
const int TIME = 50;
const String DATE_FORMAT = "%d/%m/%Y %H:%i:%s";

// Reused classes
late DateUtil d;
late DateTime dt;

// Data providers
const List<(String, String)> TEST_FORMAT_DATE_DP = [
  ("20/7/1969 20:18:4", "%d/%m/%Y %H:%i:%s"),
  ("20/7/1969T20:18:4, Sun, Jul, 69, 8pm", "%d/%m/%YT%H:%i:%s, %D, %M, %y, %h"),
];
const List<(String, int)> TEST_GET_HOUR_DP = [
  ("12am", 0),
  ("10am", 10),
  ("12pm", 12),
  ("10pm", 22),
];
const List<(Month, int)> TEST_GET_MONTH_DP = [(Month.Jan, 1), (Month.Apr, 4), (Month.Oct, 10), (Month.Dec, 12)];
const List<int> TEST_GET_MONTH_THROWS_DP = [0, -13, 150];
const List<(Weekday, int)> TEST_GET_DAY_DP = [
  (Weekday.Mon, 1),
  (Weekday.Fri, 5),
  (Weekday.Sun, 7),
];
const List<int> TEST_GET_DAY_THROWS_DP = [0, -5, 100];
const List<(String, String)> TEST_GET_VALUE_DP = [
  ("20", "d"),
  ("Sun", "D"),
  ("7", "m"),
  ("Jul", "M"),
  ("69", "y"),
  ("1969", "Y"),
  ("8pm", "h"),
  ("20", "H"),
  ("18", "i"),
  ("4", "s"),
  ("", "")
];
const List<String> TEST_GET_VALUE_THROWS_DP = ["hello, world", "S"];

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
      for ((String, String) data in TEST_FORMAT_DATE_DP) {
        expect(data.$1, d.formatDate(data.$2));
      }
    });
    test("Test getHour", () {
      for ((String, int) data in TEST_GET_HOUR_DP) {
        expect(data.$1, d.getHour(data.$2));
      }
    });
    test("Test getMonth", () {
      // Test success cases
      for ((Month, int) i in TEST_GET_MONTH_DP) {
        expect(i.$1, d.getMonth(i.$2));
      }
      // Test Exceptions
      for (int i in TEST_GET_MONTH_THROWS_DP) {
        expect(() => d.getMonth(i), throwsException);
      }
    });
    test("Test getWeekDay", () {
      // Test success cases
      for ((Weekday, int) i in TEST_GET_DAY_DP) {
        expect(i.$1, d.getWeekDay(i.$2));
      }
      // Test Exceptions
      for (int i in TEST_GET_DAY_THROWS_DP) {
        expect(() => d.getWeekDay(i), throwsException);
      }
    });
    test("Test getValue", () {
      // Test success cases
      for ((String, String) i in TEST_GET_VALUE_DP) {
        expect(i.$1, d.getValue(i.$2));
      }
      // Test Exceptions
      for (String i in TEST_GET_VALUE_THROWS_DP) {
        expect(() => d.getValue(i), throwsException);
      }
    });
  });
}

String _getDateTime(DateTime dt) => "${dt.day}/${dt.month}/${dt.year} ${dt.hour}:${dt.minute}:${dt.second}";
