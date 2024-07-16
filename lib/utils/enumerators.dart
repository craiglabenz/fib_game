extension IntBuilder on int {
  Iterable<T> build<T>(T Function(int) builder) sync* {
    int index = 0;
    while (index < this) {
      yield builder(index);
      index++;
    }
  }
}
