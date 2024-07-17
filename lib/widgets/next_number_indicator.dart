import 'package:fib_game/game/game.dart';
import 'package:flutter/material.dart';

class NextNumberIndicator extends StatelessWidget {
  const NextNumberIndicator({
    required this.direction,
    required this.nextNumber,
    required this.numberPosition,
    required this.totalSlots,
    super.key,
  });

  /// Indicates the orientation of this indicator relative to the game board.
  /// A value of [Direction.vertical] means the indicator will be on the left
  /// or right of the game board, and [Direction.horizontal] means the indicator
  /// will be above or below the game board.
  final Direction direction;

  /// The number to be added to the board.
  final int nextNumber;

  /// The place to render [nextNumber]. Indicates which row would receive the
  /// number if [direction] is [Direction.vertical], for example.
  final int numberPosition;

  /// The total number of places [nextNumber] could be rendered (the number of
  /// rows if [direction] is [Direction.vertical], for example).
  final int totalSlots;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      late double top;
      late double left;
      late double width;
      late double height;
      switch (direction) {
        case Direction.vertical:
          {
            left = 0.0;
            height = constraints.maxHeight / totalSlots;
            width = constraints.maxWidth;
            top = height * numberPosition;
          }
        case Direction.horizontal:
          {
            top = 0.0;
            width = constraints.maxWidth / totalSlots;
            height = constraints.maxHeight;
            left = width * numberPosition;
          }
      }
      return Container(
        decoration: BoxDecoration(
            // border: Border.all(color: Colors.purple),
            ),
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              top: top,
              left: left,
              width: width,
              height: height,
              child: Center(
                child: Text(
                  '$nextNumber',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
