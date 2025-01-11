/// Play a game of [FizzBuzz]
class FizzBuzz {
  int fizz, buzz, max;
  FizzBuzz({required this.fizz, required this.buzz, required this.max});

  /// Play [FizzBuzz] using a for loop
  String play() {
    String str = "";
    for (int i = 0; i < max + 1; i++) {
      str = this.checkConditions(i, str);
    }
    return str;
  }

  /// Play [FizzBuzz] using an [Iterator]
  String play2() {
    return Iterable<int>.generate(this.max + 1, (i) => i).fold<String>("", (str, i) {
      return this.checkConditions(i, str);
    });
  }

  /// Check necessary [FizzBuzz] game conditions
  String checkConditions(int i, String str) {
    if (i <= 0) return "";
    if (i % this.fizz == 0) str += "fizz";
    if (i % this.buzz == 0) str += "buzz";
    if (!str.endsWith('z')) str += "$i";
    if (i < this.max) str += '\n';
    return str;
  }
}
