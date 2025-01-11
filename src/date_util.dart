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
        return this._getWeekDay(this._date.weekday);
      case 'm':
        return "${this._date.month}";
      case 'M':
        return this._getMonth(this._date.month);
      case 'y':
        return "${this._date.year.toString().substring(2)}";
      case 'Y':
        return "${this._date.year}";
      case 'h':
        return this._getHour(this._date.hour);
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

  /// Get week day from [DateTime.weekday]
  String _getWeekDay(int i) {
    switch (i) {
      case 1:
        return "Mon";
      case 2:
        return "Tue";
      case 3:
        return "Wed";
      case 4:
        return "Thu";
      case 5:
        return "Fri";
      case 6:
        return "Sat";
      case 7:
        return "Sun";
      default:
        throw Exception("Weekday out of bounds\nexpected 1-8\nrecieved: $i");
    }
  }

  /// Get month for [DateTime.month]
  String _getMonth(int i) {
    switch (i) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        throw Exception("Month out of bounds\nexpected 1-12\nrecieved: $i");
    }
  }

  /**
   * Convert a recieved int [i] representing 24hr time to 12hr time
   * ``` dart
   * _getHour(0); // 12am
   * _getHour(10); // 10am
   * _getHour(12); // 12pm
   * _getHour(22); // 10pm
   * ```
   */
  String _getHour(int i) {
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
