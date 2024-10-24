bool check_palindrome(String input) {
  for (int i = 0; i < input.length; i++) {
    if (i > input.length - 1) break;
    if (input[i] != input[input.length - (i + 1)]) return false;
  }
  return true;
}
