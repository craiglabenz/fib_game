import 'package:fib_game/game/game.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state.freezed.dart';

@Freezed()
class GameState with _$GameState {
  const GameState._();
  const factory GameState({
    @Default(startingBoard) List<List<int?>> board,
    required Origin nextNumberOrigin,
    required int nextNumber,
  }) = _GameState;

  int get numRows => 4;
  int get numCols => 4;

  factory GameState.initial() => GameState(
        nextNumberOrigin: Origin.random,
        nextNumber: 1,
      );
}

const List<List<int?>> startingBoard = [
  [null, null, null, null],
  [null, 1, null, 2],
  [null, null, 1, null],
  [null, null, null, 3],
];
