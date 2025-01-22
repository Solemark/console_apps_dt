class Reverse {
  List<dynamic> newArray(List<dynamic> data) {
    List<dynamic> output = [];
    for (final i in data) {
      output = [i, ...output];
    }
    return output;
  }

  List<dynamic> sameArray(List<dynamic> data) {
    for (int i = 0, j = data.length - 1; i < j; i++, j--) {
      final x = data[i], y = data[j];
      data[i] = y;
      data[j] = x;
    }
    return data;
  }

  String newString(String data) {
    String output = "";
    for (int i = 0; i < data.length; i++) {
      output = data[i] + output;
    }
    return output;
  }

  num newNumber(num data) {
    String output = this.newString(data.toString());
    return num.parse(output);
  }
}
