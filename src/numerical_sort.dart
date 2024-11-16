class NumericalSort {
  late Iterable<num> data;
  NumericalSort(this.data);
  Iterable<num> get num_sort => this.data.toList()..sort();
  Iterable<num> get numSort {
    List<num> out = this.data.toList();
    out.sort();
    return out;
  }
}
