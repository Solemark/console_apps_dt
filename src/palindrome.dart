bool isPalindrome(String input) {
  for (int i = 0, j = input.length - 1; i < input.length; i++, j--) {
    if (i > j) break;
    if (input[i] != input[j]) return false;
  }
  return true;
}