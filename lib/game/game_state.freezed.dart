// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GameState {
  Board get board => throw _privateConstructorUsedError;
  Origin get nextNumberOrigin => throw _privateConstructorUsedError;
  int get nextNumber => throw _privateConstructorUsedError;
  int get numRows => throw _privateConstructorUsedError;
  int get numCols => throw _privateConstructorUsedError;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call(
      {Board board,
      Origin nextNumberOrigin,
      int nextNumber,
      int numRows,
      int numCols});
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? board = null,
    Object? nextNumberOrigin = null,
    Object? nextNumber = null,
    Object? numRows = null,
    Object? numCols = null,
  }) {
    return _then(_value.copyWith(
      board: null == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as Board,
      nextNumberOrigin: null == nextNumberOrigin
          ? _value.nextNumberOrigin
          : nextNumberOrigin // ignore: cast_nullable_to_non_nullable
              as Origin,
      nextNumber: null == nextNumber
          ? _value.nextNumber
          : nextNumber // ignore: cast_nullable_to_non_nullable
              as int,
      numRows: null == numRows
          ? _value.numRows
          : numRows // ignore: cast_nullable_to_non_nullable
              as int,
      numCols: null == numCols
          ? _value.numCols
          : numCols // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameStateImplCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory _$$GameStateImplCopyWith(
          _$GameStateImpl value, $Res Function(_$GameStateImpl) then) =
      __$$GameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Board board,
      Origin nextNumberOrigin,
      int nextNumber,
      int numRows,
      int numCols});
}

/// @nodoc
class __$$GameStateImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateImpl>
    implements _$$GameStateImplCopyWith<$Res> {
  __$$GameStateImplCopyWithImpl(
      _$GameStateImpl _value, $Res Function(_$GameStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? board = null,
    Object? nextNumberOrigin = null,
    Object? nextNumber = null,
    Object? numRows = null,
    Object? numCols = null,
  }) {
    return _then(_$GameStateImpl(
      board: null == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as Board,
      nextNumberOrigin: null == nextNumberOrigin
          ? _value.nextNumberOrigin
          : nextNumberOrigin // ignore: cast_nullable_to_non_nullable
              as Origin,
      nextNumber: null == nextNumber
          ? _value.nextNumber
          : nextNumber // ignore: cast_nullable_to_non_nullable
              as int,
      numRows: null == numRows
          ? _value.numRows
          : numRows // ignore: cast_nullable_to_non_nullable
              as int,
      numCols: null == numCols
          ? _value.numCols
          : numCols // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GameStateImpl extends _GameState {
  const _$GameStateImpl(
      {required this.board,
      required this.nextNumberOrigin,
      required this.nextNumber,
      this.numRows = 4,
      this.numCols = 4})
      : super._();

  @override
  final Board board;
  @override
  final Origin nextNumberOrigin;
  @override
  final int nextNumber;
  @override
  @JsonKey()
  final int numRows;
  @override
  @JsonKey()
  final int numCols;

  @override
  String toString() {
    return 'GameState(board: $board, nextNumberOrigin: $nextNumberOrigin, nextNumber: $nextNumber, numRows: $numRows, numCols: $numCols)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateImpl &&
            (identical(other.board, board) || other.board == board) &&
            (identical(other.nextNumberOrigin, nextNumberOrigin) ||
                other.nextNumberOrigin == nextNumberOrigin) &&
            (identical(other.nextNumber, nextNumber) ||
                other.nextNumber == nextNumber) &&
            (identical(other.numRows, numRows) || other.numRows == numRows) &&
            (identical(other.numCols, numCols) || other.numCols == numCols));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, board, nextNumberOrigin, nextNumber, numRows, numCols);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      __$$GameStateImplCopyWithImpl<_$GameStateImpl>(this, _$identity);
}

abstract class _GameState extends GameState {
  const factory _GameState(
      {required final Board board,
      required final Origin nextNumberOrigin,
      required final int nextNumber,
      final int numRows,
      final int numCols}) = _$GameStateImpl;
  const _GameState._() : super._();

  @override
  Board get board;
  @override
  Origin get nextNumberOrigin;
  @override
  int get nextNumber;
  @override
  int get numRows;
  @override
  int get numCols;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
