import 'package:fib_game/game/game.dart';
import 'package:flutter/material.dart';

class GridGuideline extends StatelessWidget {
  const GridGuideline({
    required this.borderThickness,
    required this.direction,
    required this.index,
    required this.numGuides,
    required this.size,
    required this.squareSize,
    super.key,
  });

  final Size squareSize;
  final double borderThickness;
  final Direction direction;
  final int index;
  final int numGuides;
  final Size size;

  double get top => direction.isHorizontal //
      ? squareSize.height * index
      : 0;

  double get left => direction.isVertical //
      ? squareSize.width * index
      : 0;

  @override
  Widget build(BuildContext context) => Positioned(
        top: top + borderThickness,
        left: left + borderThickness,
        height: size.height,
        width: size.width,
        key: ValueKey('${direction.name}-$index'),
        child: const ColoredBox(color: Colors.grey),
      );

  String debugString() =>
      'GridGuideline($direction :: $index :: top: $top, left: $left)';
}
