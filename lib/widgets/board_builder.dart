import 'package:fib_game/game/game.dart';
import 'package:fib_game/utils/utils.dart';
import 'package:flutter/widgets.dart';

class BoardBuilder {
  BoardBuilder({
    required this.borderThickness,
    required this.gridGuideThickness,
    required this.squareSize,
    required this.totalSize,
  });

  /// Thickness of the outermost border.
  final double borderThickness;

  /// Thickness of each inner grid line.
  final double gridGuideThickness;

  /// Total size of an individual square, including space to be allocated to the
  /// grid guide.
  final Size squareSize;

  Size? _innerSquareSize;
  Size get innerSquareSize => _innerSquareSize ??= Size(
        squareSize.width - (gridGuideThickness * 2) + 1,
        squareSize.height - (gridGuideThickness * 2) + 1,
      );

  /// All available size for the game - inner squares plus outer border.
  final Size totalSize;

  Size? _innerSize;
  Size get innerSize => _innerSize ??= Size(
        totalSize.width - borderThickness * 2,
        totalSize.height - borderThickness * 2,
      );

  BoxConstraints get insideBorderConstraints => BoxConstraints.expand(
        height: totalSize.height - borderThickness * 2,
        width: totalSize.width - borderThickness * 2,
      );

  Position gridGuidelinePosition(Direction direction, int index) => Position(
        top: (direction.isHorizontal ? squareSize.height * (index + 1) : 0) +
            borderThickness,
        left: (direction.isVertical ? squareSize.width * (index + 1) : 0) +
            borderThickness,
        height: direction.isVertical ? innerSize.height : gridGuideThickness,
        width: direction.isHorizontal ? innerSize.width : gridGuideThickness,
      );

  Position boardBorderPosition(Origin side, bool isActive) => switch (side) {
        Origin.top => Position(
            top: 0,
            left: 0,
            width: totalSize.width,
            height: isActive ? borderThickness * 2 : borderThickness,
          ),
        Origin.bottom => Position(
            bottom: 0,
            left: 0,
            width: totalSize.width,
            height: isActive ? borderThickness * 2 : borderThickness,
          ),
        Origin.left => Position(
            left: 0,
            top: 0,
            height: totalSize.height,
            width: isActive ? borderThickness * 2 : borderThickness,
          ),
        Origin.right => Position(
            right: 0,
            top: 0,
            height: totalSize.height,
            width: isActive ? borderThickness * 2 : borderThickness,
          ),
      };

  Position getSquarePosition(int colIndex, int rowIndex) => Position(
        top: (squareSize.height * rowIndex) +
            borderThickness +
            // Add space for the undrawn top grey border
            gridGuideThickness,
        left: (squareSize.width * colIndex) +
            borderThickness +
            // Add space for the undrawn left grey border
            gridGuideThickness,
        height: innerSquareSize.height,
        width: innerSquareSize.width,
      );
}
