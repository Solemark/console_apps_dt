Iterable<String> get_table(int table, int max) =>
    Iterable<int>.generate(max + 1, (i) => i).map((number) => "$table x $number = ${table * number}");
