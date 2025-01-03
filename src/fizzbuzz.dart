class FizzBuzz {
  int fizz, buzz, max;
  FizzBuzz(this.fizz, this.buzz, this.max);
  String get play {
    String output = "";
    for (int i = 1; i < max + 1; i++) {
      if (i % fizz == 0) output += "fizz";
      if (i % buzz == 0) output += "buzz";
      if (!output.endsWith("z")) output += "$i";
      if (i < max) output += "\n";
    }
    return output;
  }
}
