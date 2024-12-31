class Date {
  DateTime date = DateTime.now();
  String get current => "${this.date.day}/${this.date.month}/${this.date.year}";
}
