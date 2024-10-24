List<dynamic> new_array(List<dynamic> input) {
  List<dynamic> output = [];
  for (final i in input) {
    output = [i, ...output];
  }
  return output;
}

List<dynamic> same_array(List<dynamic> input) {
  int i = 0;
  int j = input.length - 1;
  while (i < j) {
    final x = input[i];
    final y = input[j];
    input[i] = y;
    input[j] = x;
    i++;
    j--;
  }
  return input;
}
