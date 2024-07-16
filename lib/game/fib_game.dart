import 'dart:math';
import 'package:fib_game/game/game.dart';

class FibGame {
  FibGame(this.rnd);

  Random rnd;
  GameState? _state;
  GameState get state {
    assert(_state != null, 'It appears you forgot toc call FibGame.initialize');
    return _state!;
  }

  void initialize([GameState? state]) {
    _state = state ?? GameState.initial();
  }

  int randomNextNumber() => Fibonacci.get(rnd.nextInt(3) + 1);
}
