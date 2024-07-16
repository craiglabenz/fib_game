import 'dart:math';
import 'package:fib_game/game/game.dart';
import 'package:flutter/widgets.dart';
import 'package:fib_game/widgets/widgets.dart';

class GameArea extends StatelessWidget {
  const GameArea({
    this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    required this.game,
    super.key,
  });

  final FibGame game;

  /// Blank space around the GameBoard. Values in [padding] are treated as
  /// percentages, not raw pixel values.
  final EdgeInsets padding;

  double get gameBoardHeight =>
      1 - (padding.top * 0.01) - (padding.bottom * 0.01);
  double get gameBoardWidth =>
      1 - (padding.left * 0.01) - (padding.right * 0.01);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableHeight = constraints.maxHeight * gameBoardHeight;
        final availableWidth = constraints.maxWidth * gameBoardWidth;

        final functionalSize = min(availableWidth, availableHeight);
        print('functional size: $functionalSize');

        final confirmButtonSize = min(constraints.maxWidth * 0.6, 200.0);

        return Stack(
          children: <Widget>[
            Positioned(
              // left: constraints.maxWidth - (padding.left * 0.01),
              // top: constraints.maxHeight * (padding.top * 0.01),
              left: (constraints.maxWidth - functionalSize) / 2,
              top: (constraints.maxHeight - functionalSize) / 2,
              height: functionalSize,
              width: functionalSize,
              child: GameBoard(game: game),
            ),
            Positioned(
              bottom: constraints.maxHeight * 0.05,
              height: constraints.maxHeight * 0.1,
              left: (constraints.maxWidth - confirmButtonSize) / 2,
              width: confirmButtonSize,
              child: ConfirmMoveButton(),
            ),
          ],
        );
      },
    );
  }
}
