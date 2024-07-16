import 'package:fib_game/game/game.dart';

class FibGame {
  FibGame(GameState initialState) : _state = initialState;

  GameState _state;
  GameState get state => _state;
}
