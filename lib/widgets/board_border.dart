import 'package:fib_game/game/game.dart';
import 'package:flutter/material.dart';

class BoardBorder extends StatelessWidget {
  const BoardBorder({
    required this.boardSize,
    required this.isActive,
    required this.side,
    required this.thickness,
    super.key,
  });

  final Size boardSize;
  final bool isActive;
  final Origin side;
  final double thickness;

  Positioned _build(Widget child) => switch (side) {
        Origin.top => Positioned(
            top: 0,
            left: 0,
            width: boardSize.width,
            height: isActive ? thickness * 2 : thickness,
            child: child,
          ),
        Origin.bottom => Positioned(
            bottom: 0,
            left: 0,
            width: boardSize.width,
            height: isActive ? thickness * 2 : thickness,
            child: child,
          ),
        Origin.left => Positioned(
            left: 0,
            top: 0,
            height: boardSize.height,
            width: isActive ? thickness * 2 : thickness,
            child: child,
          ),
        Origin.right => Positioned(
            right: 0,
            top: 0,
            height: boardSize.height,
            width: isActive ? thickness * 2 : thickness,
            child: child,
          ),
      };

  @override
  Widget build(BuildContext context) {
    return _build(
      ColoredBox(color: isActive ? Colors.red : Colors.blue),
    );
  }
}
