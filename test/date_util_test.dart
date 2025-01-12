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

Future<void> main() async {
  setUp(() async {
    dt = DateTime(1969, 07, 20, 20, 18, 04);
    d = DateUtil(dt);
  });

  await testMonth();
  await testDays();
  await testWeekDay();
  await testHours();
  await testSeconds();
  await testDate();
  await testValue();
}

Future<void> testMonth() async {
  group("Test Month", () {
    test("Success", () async {
      for ((Month, int) i in TEST_GET_MONTH_DP) {
        expect(i.$1, d.getMonth(i.$2));
      }
    });
    test("Exception", () async {
      for (int i in TEST_GET_MONTH_THROWS_DP) {
        expect(() => d.getMonth(i), throwsException);
      }
    });
  });
}

Future<void> testDays() async {
  group("Test days", () {
    test("addDays", () async {
      d.addDays(TIME);
      dt = dt.add(Duration(days: TIME));
      expect(_getDateTime(dt), d.formatDate(DATE_FORMAT));
    });
    test("subDays", () async {
      d.subDays(TIME);
      dt = dt.subtract(Duration(days: TIME));
      expect(_getDateTime(dt), d.formatDate(DATE_FORMAT));
    });
  });
}

Future<void> testWeekDay() async {
  group("Test getWeekDay", () {
    test("Success", () async {
      for ((Weekday, int) i in TEST_GET_DAY_DP) {
        expect(i.$1, d.getWeekDay(i.$2));
      }
    });
    test("Exceptions", () async {
      for (int i in TEST_GET_DAY_THROWS_DP) {
        expect(() => d.getWeekDay(i), throwsException);
      }
    });
  });
}

Future<void> testHours() async {
  group("Test hours", () {
    test("addHours", () async {
      d.addHours(TIME);
      dt = dt.add(Duration(hours: TIME));
      expect(_getDateTime(dt), d.formatDate(DATE_FORMAT));
    });
    test("subHours", () async {
      d.subHours(TIME);
      dt = dt.subtract(Duration(hours: TIME));
      expect(_getDateTime(dt), d.formatDate(DATE_FORMAT));
    });
    test("getHour", () async {
      for ((String, int) data in TEST_GET_HOUR_DP) {
        expect(data.$1, d.getHour(data.$2));
      }
    });
  });
}

Future<void> testSeconds() async {
  group("Test Seconds", () {
    test("addSeconds", () async {
      d.addSeconds(TIME);
      dt = dt.add(Duration(seconds: TIME));
      expect(_getDateTime(dt), d.formatDate(DATE_FORMAT));
    });
    test("subSeconds", () async {
      d.subSeconds(TIME);
      dt = dt.subtract(Duration(seconds: TIME));
      expect(_getDateTime(dt), d.formatDate(DATE_FORMAT));
    });
  });
}

Future<void> testDate() async {
  group("Test Dates", () {
    test("setDate", () async {
      dt = dt.add(Duration(days: TIME));
      d.setDateTime(dt);
      expect(_getDateTime(dt), d.formatDate(DATE_FORMAT));
    });
    test("diffDates", () async => expect(TIME, d.diff(dt.add(Duration(days: TIME))).inDays.abs()));
    test("formatDate", () async {
      for ((String, String) data in TEST_FORMAT_DATE_DP) {
        expect(data.$1, d.formatDate(data.$2));
      }
    });
  });
}

Future<void> testValue() async {
  group("Test getValue", () {
    test("Success", () async {
      for ((String, String) i in TEST_GET_VALUE_DP) {
        expect(i.$1, d.getValue(i.$2));
      }
    });
    test("Exceptions", () async {
      for (String i in TEST_GET_VALUE_THROWS_DP) {
        expect(() => d.getValue(i), throwsException);
      }
    });
  });
}
