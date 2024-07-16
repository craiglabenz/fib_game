import 'dart:math';
import 'package:fib_game/game/game.dart';
import 'package:flutter/widgets.dart';
import 'package:fib_game/widgets/widgets.dart';

class GameArea extends StatelessWidget {
  const GameArea({
    required this.game,
    this.borderThickness = 2,
    this.gridGuideThickness = 1,
    super.key,
  });

  final FibGame game;

  final double borderThickness;

  final double gridGuideThickness;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final builder = BoardBuilder(
          borderThickness: borderThickness,
          gridGuideThickness: gridGuideThickness,
          numCols: game.state.board.numCols,
          numRows: game.state.board.numRows,
          windowSize: constraints.biggest,
        );

        final confirmButtonSize = min(constraints.maxWidth * 0.6, 200.0);

        return Stack(
          children: <Widget>[
            builder.gameBoardPosition().toWidget(
                  child: GameBoard(game: game, builder: builder),
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
