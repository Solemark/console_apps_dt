class MathTable {
  int table, max;
  MathTable(this.table, this.max);
  Iterable<String> get string =>
      Iterable<int>.generate(this.max + 1, (i) => i).map((i) => "${this.table} x $i = ${this.table * i}");
}
