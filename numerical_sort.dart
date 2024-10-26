List<num> numerical_sort(List<num> data) => data..sort();

Iterable<num> numSort(Iterable<num> data) {
  List<num> output = data.toList();
  output.sort();
  return output;
}
