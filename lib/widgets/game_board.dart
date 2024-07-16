import 'package:fib_game/game/game.dart';
import 'package:fib_game/utils/utils.dart';
import 'package:fib_game/widgets/widgets.dart';
import 'package:flutter/material.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({
    required this.builder,
    required this.game,
    super.key,
  });

  final BoardBuilder builder;
  final FibGame game;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final children = <Widget>[];
        children.addAll(_buildGridGuide(builder));
        children.addAll(_buildBorders(builder));
        children.addAll(
          _buildNumbers(builder, game.state),
        );

        return Stack(children: children);
      },
    );
  }

  List<Widget> _buildGridGuide(BoardBuilder builder) {
    final widgets = [
      ...(game.state.board.numCols - 1).build<Positioned>(
        (index) => builder
            .gridGuidelinePosition(
              Direction.vertical,
              index,
            )
            .toWidget(child: const ColoredBox(color: Colors.grey)),
      ),
      ...(game.state.board.numRows - 1).build<Positioned>(
        (index) => builder
            .gridGuidelinePosition(
              Direction.horizontal,
              index,
            )
            .toWidget(child: const ColoredBox(color: Colors.grey)),
      ),
    ];
    return widgets;
  }

  List<Widget> _buildBorders(BoardBuilder builder) {
    return Origin.values.map<Positioned>(
      (origin) {
        final isActive = origin == game.state.nextNumberOrigin;
        return builder.boardBorderPosition(origin, isActive).toWidget(
              child: ColoredBox(color: isActive ? Colors.red : Colors.blue),
            );
      },
    ).toList();
  }

  List<Widget> _buildNumbers(BoardBuilder builder, GameState state) {
    final numbers = <Widget>[];
    for (final (int rowIndex, List<int?> row) in state.board.rowsIndexed) {
      for (final (int colIndex, int? number) in row.indexed) {
        if (number != null) {
          numbers.add(
            builder.getSquarePosition(colIndex, rowIndex).toWidget(
                  child: Container(
                    decoration: builder.showDebugLines
                        ? BoxDecoration(border: Border.all(color: Colors.green))
                        : null,
                    child: Center(
                      child: Text(number.toString()),
                    ),
                  ),
                ),
          );
        }
      }
    }
    return numbers;
  }
}
