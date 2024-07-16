import 'dart:math';
import 'package:fib_game/game/game.dart';
import 'package:flutter/widgets.dart';
import 'package:fib_game/widgets/widgets.dart';

class GameArea extends StatelessWidget {
  const GameArea({
    this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    this.boardBorderThickness = 2,
    required this.game,
    super.key,
  });

  final FibGame game;

  final double boardBorderThickness;

  /// Blank space around the GameBoard. Values in [padding] are treated as
  /// percentages, not raw pixel values.
  final EdgeInsets padding;

  /// Percentage of total vertical space available for this board, given padding
  /// rules.
  double get gameBoardHeight =>
      1 - (padding.top * 0.01) - (padding.bottom * 0.01);

  /// Percentage of total horizontal space available for this board, given
  /// padding rules.
  double get gameBoardWidth =>
      1 - (padding.left * 0.01) - (padding.right * 0.01);

  double get totalBorderThickness => (boardBorderThickness * 2);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableHeight = constraints.maxHeight * gameBoardHeight;
        final availableWidth = constraints.maxWidth * gameBoardWidth;

        final maxWidthPerSquare =
            (availableWidth - totalBorderThickness) / game.state.board.numCols;
        final maxHeightPerSquare =
            (availableHeight - totalBorderThickness) / game.state.board.numRows;

        final squareSize = min(maxWidthPerSquare, maxHeightPerSquare);

        final functionalWidth =
            game.state.board.numCols * squareSize + totalBorderThickness;
        final functionalHeight =
            game.state.board.numRows * squareSize + totalBorderThickness;

        final confirmButtonSize = min(constraints.maxWidth * 0.6, 200.0);

        return Stack(
          children: <Widget>[
            Positioned(
              left: (constraints.maxWidth - functionalWidth) / 2,
              top: (constraints.maxHeight - functionalHeight) / 2,
              width: functionalWidth,
              height: functionalHeight,
              child: GameBoard(
                game: game,
                borderThickness: boardBorderThickness,
                squareSize: Size.square(squareSize),
              ),
            ),
            Positioned(
              bottom: constraints.maxHeight * 0.05,
              left: (constraints.maxWidth - confirmButtonSize) / 2,
              width: confirmButtonSize,
              height: constraints.maxHeight * 0.1,
              child: const ConfirmMoveButton(),
            ),
          ],
        );
      },
    );
  }
}
