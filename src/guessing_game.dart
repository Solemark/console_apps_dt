import 'dart:math';
import 'dart:io';

class GuessingGame {
  int number = 0;
  GuessingGame([int max = 10]) {
    this.number = Random().nextInt(max + 1);
    play(max);
  }

  void play(int max) {
    bool flag = false;
    print("I'm thinking of a number between 1 and $max!");
    while (!flag) {
      int inp = int.parse(stdin.readLineSync() ?? "0");
      flag = checkResult(inp);
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
