class NumericalSort {
  late Iterable<num> data;
  NumericalSort(this.data);
  Iterable<num> numSort() => this.data.toList()..sort();
}
