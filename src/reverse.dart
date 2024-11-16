class Reverse {
  List<dynamic> data;
  Reverse(this.data);
  List<dynamic> get narr {
    List<dynamic> output = [];
    for (final i in this.data) {
      output = [i, ...output];
    }
    return output;
  }

  List<dynamic> get sarr {
    for (int i = 0, j = this.data.length - 1; i < j; i++, j--) {
      final x = this.data[i], y = this.data[j];
      this.data[i] = y;
      this.data[j] = x;
    }
    return this.data;
  }
}
