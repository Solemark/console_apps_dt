class MathTable {
  late int table, max;
  MathTable(this.table, this.max);
  Iterable<String> stringify() =>
      Iterable<int>.generate(this.max + 1, (i) => i).map((i) => "${this.table} x $i = ${this.table * i}");
  Iterable<num> calculate() => Iterable<num>.generate(this.max + 1, (i) => i).map((i) => i * this.table);
}
