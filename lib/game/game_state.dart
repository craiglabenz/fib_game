import 'package:fib_game/game/game.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state.freezed.dart';

@Freezed()
class GameState with _$GameState {
  const GameState._();
  const factory GameState({
    required Board board,
    required Origin nextNumberOrigin,
    required int nextNumber,
    @Default(4) int numRows,
    @Default(4) int numCols,
  }) = _GameState;

  factory GameState.initial([Board? board]) => GameState(
        board: board ?? (Board.square(4)..populate()),
        nextNumberOrigin: Origin.random,
        nextNumber: 1,
      );
}
