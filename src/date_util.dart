enum Weekday { Mon, Tue, Wed, Thu, Fri, Sat, Sun }

enum Month { Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec }

class DateUtil {
  late DateTime _date;
  DateUtil([DateTime? date = null]) {
    this._date = date ?? DateTime.now();
  }
  /**
   * Diff the current [DateTime] against the previous [DateTime]
   * as current [DateTime] - [dt]
   */
  Duration diff(DateTime dt) => this._date.difference(dt);

  /// Set the value of the [DateTime] object
  void setDateTime(DateTime dt) => this._date = dt;

  /// add a number of days to [DateTime] object
  void addDays(int d) => this._date = this._date.add(Duration(days: d));

  /// subtract a number of days to [DateTime] object
  void subDays(int d) => this._date = this._date.subtract(Duration(days: d));

  /// add a number of hours to [DateTime] object
  void addHours(int h) => this._date = this._date.add(Duration(hours: h));

  /// subtract a number of hours to [DateTime] object
  void subHours(int h) => this._date = this._date.subtract(Duration(hours: h));

  /// add a number of seconds to [DateTime] object
  void addSeconds(int s) => this._date = this._date.add(Duration(seconds: s));

  /// subtract a number of seconds to [DateTime] object
  void subSeconds(int s) => this._date = this._date.subtract(Duration(seconds: s));

  /**
   * Use a magic string to format the date
   * ```dart
   * //           (Y, m, d, H, i, s)
   * DateUtil d = DateUtil(1969, 07, 20, 20, 18, 04);
   * d.formatDate("%d"); // 20 (date)
   * d.formatDate("%D"); // Mon (day)
   * d.formatDate("%m"); // 07 (month)
   * d.formatDate("%M"); // Jul (month)
   * d.formatDate("%y"); // 69 (year)
   * d.formatDate("%Y"); // 1969 (year)
   * d.formatDate("%h"); // 08 (12hr)
   * d.formatDate("%H"); // 20 (24h)
   * d.formatDate("%i"); // 18 (min)
   * d.formatDate("%s"); // 04 (sec)
   * ```
   */
  String formatDate(String f) {
    String output = "";
    List<String> ft = f.split('%');
    for (String i in ft) {
      String j = "";
      if (i.length > 1) {
        j = i.substring(1);
        i = i[0];
      }
      output += "${this._getValue(i)}$j";
    }
    return output;
  }

  /// Parse each component of the string from [formatDate]
  String _getValue(String i) {
    if (i == "") return "";
    switch (i) {
      case 'd':
        return "${this._date.day}";
      case 'D':
        return this.getWeekDay(this._date.weekday).name;
      case 'm':
        return "${this._date.month}";
      case 'M':
        return this.getMonth(this._date.month).name;
      case 'y':
        return "${this._date.year.toString().substring(2)}";
      case 'Y':
        return "${this._date.year}";
      case 'h':
        return this.getHour(this._date.hour);
      case 'H':
        return "${this._date.hour}";
      case 'i':
        return "${this._date.minute}";
      case 's':
        return "${this._date.second}";
      default:
        throw Exception("Invalid value\nExpected: %d, %D, %m, %M, %y, %Y, %h, %H, %i, %s\nRecieved: $i");
    }
  }

  /**
   * Get the day of the week from [DateTime.weekday] (1-7)
   * ``` dart
   * getWeekDay(1); // Mon
   * getWeekDay(2); // Tue
   * getWeekDay(3); // Wed
   * getWeekDay(4); // Thu
   * getWeekDay(5); // Fri
   * getWeekDay(6); // Sat
   * getWeekDay(7); // Sun
   * ```
   */
  Weekday getWeekDay(int i) {
    switch (i) {
      case 1:
        return Weekday.Mon;
      case 2:
        return Weekday.Tue;
      case 3:
        return Weekday.Wed;
      case 4:
        return Weekday.Thu;
      case 5:
        return Weekday.Fri;
      case 6:
        return Weekday.Sat;
      case 7:
        return Weekday.Sun;
      default:
        throw Exception("Weekday out of bounds\nexpected 1-8\nrecieved: $i");
    }
  }

  /**
   * Get the month of the year from [DateTime.month] (1-12)
   * ``` dart
   * getMonth(1); // Jan
   * getMonth(2); // Feb
   * getMonth(3); // Mar
   * getMonth(4); // Apr
   * getMonth(5); // May
   * getMonth(6); // Jun
   * getMonth(7); // Jul
   * getMonth(8); // Aug
   * getMonth(9); // Sep
   * getMonth(10); // Oct
   * getMonth(11); // Nov
   * getMonth(12); // Dec
   * ```
   */
  Month getMonth(int i) {
    switch (i) {
      case 1:
        return Month.Jan;
      case 2:
        return Month.Feb;
      case 3:
        return Month.Mar;
      case 4:
        return Month.Apr;
      case 5:
        return Month.May;
      case 6:
        return Month.Jun;
      case 7:
        return Month.Jul;
      case 8:
        return Month.Aug;
      case 9:
        return Month.Sep;
      case 10:
        return Month.Oct;
      case 11:
        return Month.Nov;
      case 12:
        return Month.Dec;
      default:
        throw Exception("Month out of bounds\nexpected 1-12\nrecieved: $i");
    }
  }

  /**
   * Convert a recieved int [i] representing 24hr time to 12hr time
   * ``` dart
   * getHour(0); // 12am
   * getHour(10); // 10am
   * getHour(12); // 12pm
   * getHour(22); // 10pm
   * ```
   */
  String getHour(int i) {
    if (i >= 12) {
      i -= 12;
      if (i == 0) i = 12;
      return "${i}pm";
    } else {
      if (i == 0) i = 12;
      return "${i}am";
    }
  }
}
