Iterable<String> get_table(int table, int max) =>
    Iterable<int>.generate(max + 1, (i) => i).map((number) => "$table x $number = ${table * number}");

Iterable<String> getTable(int table, int max) {
  List<String> output = [];
  for (int i = 0; i <= max; i++) {
    output.add("$table x $i = ${table * i}");
  }
  return output;
}
