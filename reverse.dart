List<dynamic> newArray(List<dynamic> input) {
  List<dynamic> output = [];
  for (final i in input) {
    output = [i, ...output];
  }
  return output;
}

List<dynamic> sameArray(List<dynamic> input) {
  for (int i = 0, j = input.length - 1; i < j; i++, j--) {
    final x = input[i], y = input[j];
    input[i] = y;
    input[j] = x;
  }
  return input;
}
