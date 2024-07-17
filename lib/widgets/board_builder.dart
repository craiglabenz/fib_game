import 'dart:math';
import 'package:fib_game/game/game.dart';
import 'package:fib_game/utils/utils.dart';
import 'package:flutter/widgets.dart';

class BoardBuilder {
  BoardBuilder({
    this.padding = const EdgeInsets.fromLTRB(15, 15, 15, 30),
    this.showDebugLines = false,
    required this.borderThickness,
    required this.gridGuideThickness,
    required this.numCols,
    required this.numRows,
    required this.windowSize,
  }) {
    final availableHeight = windowSize.height * gameBoardHeight;
    final availableWidth = windowSize.width * gameBoardWidth;

    final maxWidthPerSquare = (availableWidth - totalBorderThickness) / numCols;
    final maxHeightPerSquare =
        (availableHeight - totalBorderThickness) / numRows;

    final squareSizeLen = min(maxWidthPerSquare, maxHeightPerSquare);
    _squareSize = Size.square(squareSizeLen);

    final functionalWidth = numCols * squareSize.width + totalBorderThickness;
    final functionalHeight = numRows * squareSize.height + totalBorderThickness;

    _gameAreaSize = Size(functionalWidth, functionalHeight);
    _gameAreaOffset = Size(
      paddingRaw.left,
      paddingRaw.top,
    );
  }

  final bool showDebugLines;

  /// Blank space around the GameBoard. Values in [padding] are treated as
  /// percentages, not raw pixel values.
  final EdgeInsets padding;

  double get paddingLeftPercent => padding.left * 0.01;
  double get paddingRightPercent => padding.right * 0.01;
  double get paddingTopPercent => padding.top * 0.01;
  double get paddingBottomPercent => padding.bottom * 0.01;

  double get paddingLeftRatio => padding.left / (padding.left + padding.right);
  double get paddingRightRatio =>
      padding.right / (padding.left + padding.right);
  double get paddingTopRatio => padding.top / (padding.top + padding.bottom);
  double get paddingBottomRatio =>
      padding.bottom / (padding.top + padding.bottom);

  /// Computed pixel values of `padding` after centering and scaling the game
  /// board.
  EdgeInsets get paddingRaw => _paddingRaw ??= EdgeInsets.fromLTRB(
        (windowSize.width - gameAreaSize.width) * paddingLeftRatio,
        (windowSize.height - gameAreaSize.height) * paddingTopRatio,
        (windowSize.width - gameAreaSize.width) * paddingRightRatio,
        (windowSize.height - gameAreaSize.height) * paddingBottomRatio,
      );
  EdgeInsets? _paddingRaw;

  /// Percentage of total vertical space available for this board, given padding
  /// rules.
  double get gameBoardHeight => 1 - paddingTopPercent - paddingBottomPercent;

  /// Percentage of total horizontal space available for this board, given
  /// padding rules.
  double get gameBoardWidth => 1 - paddingLeftPercent - paddingRightPercent;

  /// Thickness of the outermost border.
  final double borderThickness;
  double get totalBorderThickness => (borderThickness * 2);

  /// Thickness of each inner grid line.
  final double gridGuideThickness;

  /// Total size of an individual square, including space to be allocated to the
  /// grid guide.
  Size get squareSize => _squareSize!;
  Size? _squareSize;

  Size? _innerSquareSize;
  Size get innerSquareSize => _innerSquareSize ??= Size(
        squareSize.width - (gridGuideThickness * 2) + 1,
        squareSize.height - (gridGuideThickness * 2) + 1,
      );

  /// All available size for the game - inner squares plus outer border.
  Size get gameAreaSize => _gameAreaSize!;
  Size? _gameAreaSize;

  Size? _innerSize;
  Size get innerSize => _innerSize ??= Size(
        gameAreaSize.width - borderThickness * 2,
        gameAreaSize.height - borderThickness * 2,
      );

  /// Distance between the top-left of the game board and the window's top left.
  Size get gameAreaOffset => _gameAreaOffset!;
  Size? _gameAreaOffset;

  BoxConstraints get insideBorderConstraints => BoxConstraints.expand(
        height: gameAreaSize.height - borderThickness * 2,
        width: gameAreaSize.width - borderThickness * 2,
      );

  final int numCols;
  final int numRows;
  final Size windowSize;

  Position gameBoardPosition() => Position(
        left: gameAreaOffset.width,
        top: gameAreaOffset.height,
        width: gameAreaSize.width,
        height: gameAreaSize.height,
      );

  Position nextNumberIndicatorPosition(Origin side) {
    final verticalPadding = (windowSize.height * 0.04);
    final horizontalPadding = (windowSize.width * 0.04);
    final position = switch (side) {
      Origin.top => Position(
          top: paddingRaw.top - verticalPadding,
          left: paddingRaw.left,
          height: verticalPadding,
          width: gameAreaSize.width,
        ),
      Origin.bottom => Position(
          bottom: paddingRaw.bottom - verticalPadding,
          left: gameAreaOffset.width,
          height: verticalPadding,
          width: gameAreaSize.width,
        ),
      Origin.left => Position(
          left: gameAreaOffset.width - horizontalPadding,
          top: gameAreaOffset.height,
          width: horizontalPadding,
          height: gameAreaSize.height,
        ),
      Origin.right => Position(
          right: paddingRaw.right - horizontalPadding,
          top: gameAreaOffset.height,
          width: horizontalPadding,
          height: gameAreaSize.height,
        )
    };
    return position;
  }

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
            width: gameAreaSize.width,
            height: isActive ? borderThickness * 2 : borderThickness,
          ),
        Origin.bottom => Position(
            bottom: 0,
            left: 0,
            width: gameAreaSize.width,
            height: isActive ? borderThickness * 2 : borderThickness,
          ),
        Origin.left => Position(
            left: 0,
            top: 0,
            height: gameAreaSize.height,
            width: isActive ? borderThickness * 2 : borderThickness,
          ),
        Origin.right => Position(
            right: 0,
            top: 0,
            height: gameAreaSize.height,
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
