import 'dart:math';
import 'dart:io';

class GuessingGame {
  late int number, max;
  GuessingGame([this.max = 10]) {
    this.number = Random().nextInt(this.max + 1);
    this.play;
  }

  void play() {
    bool flag = false;
    print("I'm thinking of a number between 1 and ${this.max}!");
    while (!flag) {
      int inp = int.parse(stdin.readLineSync() ?? "0");
      flag = this.checkResult(inp);
    }
  }

  bool checkResult(int inp) {
    if (inp == this.number) {
      print("You win!");
      return true;
    } else if (inp < number) {
      print("Higher!");
    } else {
      print("Lower!");
    }
    return false;
  }
}

void main() {
  print("Pick a number!");
  int max = int.parse(stdin.readLineSync() ?? "0");
  GuessingGame(max);
}
