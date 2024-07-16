import 'package:flutter_test/flutter_test.dart';
import 'package:fib_game/game/fibonacci.dart';

void main() {
  test('Fib is not recursive', () {
    expect(Fibonacci.get(50), 12586269025);
  });
}
