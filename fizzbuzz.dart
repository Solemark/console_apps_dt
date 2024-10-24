String fizzbuzz(int fizz, int buzz, int max) {
  String output = "";
  for (final i in List.generate(max, (i) => i + 1)) {
    if (i % fizz == 0) output += "fizz";
    if (i % buzz == 0) output += "buzz";
    if (!output.endsWith("z")) output += "$i";
    if (i != max) output += "\n";
  }
  return output;
}

void main() {
  print(fizzbuzz(3, 5, 20));
}
