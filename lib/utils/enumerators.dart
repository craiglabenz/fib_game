extension IterableInt on int {
  Iterable<T> build<T>(T Function(int) builder) sync* {
    int index = 0;
    while (index < this) {
      yield builder(index);
      index++;
    }
  }

  Iterable<int> get range sync* {
    int index = 0;
    while (index < this) {
      yield index;
      index++;
    }
  }
}
