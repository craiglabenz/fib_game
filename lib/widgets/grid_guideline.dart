import 'package:fib_game/game/game.dart';
import 'package:flutter/material.dart';

class GridGuideline extends StatelessWidget {
  const GridGuideline({
    required this.boardSize,
    required this.borderThickness,
    required this.direction,
    required this.index,
    required this.numCols,
    required this.numRows,
    required this.size,
    super.key,
  });

  final Size boardSize;
  final double borderThickness;
  final Direction direction;
  final int index;
  final int numCols;
  final int numRows;
  final Size size;

  double get top => direction.isHorizontal //
      ? boardSize.height * ((index + 1) * 1 / numRows)
      : borderThickness;

  double get left => direction.isVertical //
      ? boardSize.width * ((index + 1) * 1 / numCols)
      : borderThickness;

  @override
  Widget build(BuildContext context) => Positioned(
        top: top,
        left: left,
        height: size.height,
        width: size.width,
        child: const ColoredBox(color: Colors.grey),
      );
}
