class Fibonacci {
  factory Fibonacci() => _instance;
  Fibonacci._();

  static final Fibonacci _instance = Fibonacci._();

  final _cache = <int, int>{
    1: 1,
    2: 1,
  };

  static int get(int n) {
    assert(n > 0, 'Cannot ask for 0th Fibonacci number');
    if (!_instance._cache.containsKey(n)) {
      _instance._cache[n] = get(n - 1) + get(n - 2);
    }
    return _instance._cache[n]!;
  }
}
