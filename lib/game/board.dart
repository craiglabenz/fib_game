import 'dart:math';
import 'package:fib_game/game/game.dart';
import 'package:fib_game/utils/utils.dart';

class Board {
  Board(this.numCols, this.numRows) {
    for (final _ in numRows.range) {
      spaces.add(List<int?>.filled(numCols, null));
    }
  }
  factory Board.square(int size) => Board(size, size);
  factory Board.raw(List<List<int?>> values) {
    final board = Board(values.length, values.first.length);
    // TODO: actually complete
    return board;
  }

  final int numRows;
  final int numCols;
  final spaces = <List<int?>>[];
  bool _isPopulated = false;

  void populate([int numToPopulate = 4]) {
    assert(!_isPopulated, 'Cannot repopulate already populated board');
    _isPopulated = true;

    final rnd = Random();
    final Set<(int, int)> populated = {};
    while (populated.length < numToPopulate) {
      final (int, int) coords = (rnd.nextInt(numCols), rnd.nextInt(numRows));
      if (populated.contains(coords)) continue;
      populated.add(coords);
      spaces[coords.$2][coords.$1] = Fibonacci.get(rnd.nextInt(3) + 1);
    }
  }

  Iterable<List<int?>> get rows sync* {
    for (int index in numRows.range) {
      yield getRow(index);
    }
  }

  Iterable<(int, List<int?>)> get rowsIndexed sync* {
    for (int index in numRows.range) {
      yield (index, getRow(index));
    }
  }

  Iterable<List<int?>> get cols sync* {
    for (int index in numCols.range) {
      yield getCol(index);
    }
  }

  Iterable<(int, List<int?>)> get colsIndexed sync* {
    for (int index in numCols.range) {
      yield (index, getCol(index));
    }
  }

  int? get(int x, int y) => spaces[y][x];

  List<int?> getRow(int val) {
    assert(val < numRows, 'Asked for out of range row: $val');
    return spaces[val];
  }

  List<int?> getCol(int val) {
    assert(val < numCols, 'Asked for out of range row: $val');
    return spaces.map<int?>((row) => row[val]).toList();
  }

  @override
  String toString() {
    final rowStrings = <String>[];
    for (final row in rows) {
      rowStrings.add(row.toString());
    }
    return 'Board([\n${rowStrings.join(',\n')}\n])';
  }
}
