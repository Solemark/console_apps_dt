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

/// format [DateTime] objects for string comparision in tests
String _getDateTime(DateTime dt) => "${dt.day}/${dt.month}/${dt.year} ${dt.hour}:${dt.minute}:${dt.second}";

void main() {
  setUp(() {
    dt = DateTime(1969, 07, 20, 20, 18, 04);
    d = DateUtil(dt);
  });

  testMonth();
  testDays();
  testWeekDay();
  testHours();
  testSeconds();
  testDate();
  testValue();
}

void testMonth() {
  group("Test Month", () {
    test("Success", () {
      for ((Month, int) i in TEST_GET_MONTH_DP) {
        expect(i.$1, d.getMonth(i.$2));
      }
    });
    test("Exception", () {
      for (int i in TEST_GET_MONTH_THROWS_DP) {
        expect(() => d.getMonth(i), throwsException);
      }
    });
  });
}

void testDays() {
  group("Test days", () {
    test("addDays", () {
      d.addDays(TIME);
      dt = dt.add(Duration(days: TIME));
      expect(_getDateTime(dt), d.formatDate(DATE_FORMAT));
    });
    test("subDays", () {
      d.subDays(TIME);
      dt = dt.subtract(Duration(days: TIME));
      expect(_getDateTime(dt), d.formatDate(DATE_FORMAT));
    });
  });
}

void testWeekDay() {
  group("Test getWeekDay", () {
    test("Success", () {
      for ((Weekday, int) i in TEST_GET_DAY_DP) {
        expect(i.$1, d.getWeekDay(i.$2));
      }
    });
    test("Exceptions", () {
      for (int i in TEST_GET_DAY_THROWS_DP) {
        expect(() => d.getWeekDay(i), throwsException);
      }
    });
  });
}

void testHours() {
  group("Test hours", () {
    test("addHours", () {
      d.addHours(TIME);
      dt = dt.add(Duration(hours: TIME));
      expect(_getDateTime(dt), d.formatDate(DATE_FORMAT));
    });
    test("subHours", () {
      d.subHours(TIME);
      dt = dt.subtract(Duration(hours: TIME));
      expect(_getDateTime(dt), d.formatDate(DATE_FORMAT));
    });
    test("getHour", () {
      for ((String, int) data in TEST_GET_HOUR_DP) {
        expect(data.$1, d.getHour(data.$2));
      }
    });
  });
}

void testSeconds() {
  group("Test Seconds", () {
    test("addSeconds", () {
      d.addSeconds(TIME);
      dt = dt.add(Duration(seconds: TIME));
      expect(_getDateTime(dt), d.formatDate(DATE_FORMAT));
    });
    test("subSeconds", () {
      d.subSeconds(TIME);
      dt = dt.subtract(Duration(seconds: TIME));
      expect(_getDateTime(dt), d.formatDate(DATE_FORMAT));
    });
  });
}

void testDate() {
  group("Test Dates", () {
    test("setDate", () {
      dt = dt.add(Duration(days: TIME));
      d.setDateTime(dt);
      expect(_getDateTime(dt), d.formatDate(DATE_FORMAT));
    });
    test("diffDates", () => expect(TIME, d.diff(dt.add(Duration(days: TIME))).inDays.abs()));
    test("formatDate", () {
      for ((String, String) data in TEST_FORMAT_DATE_DP) {
        expect(data.$1, d.formatDate(data.$2));
      }
    });
  });
}

void testValue() {
  group("Test getValue", () {
    test("Success", () {
      for ((String, String) i in TEST_GET_VALUE_DP) {
        expect(i.$1, d.getValue(i.$2));
      }
    });
    test("Exceptions", () {
      for (String i in TEST_GET_VALUE_THROWS_DP) {
        expect(() => d.getValue(i), throwsException);
      }
    });
  });
}
