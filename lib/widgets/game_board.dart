import 'package:fib_game/game/game.dart';
import 'package:fib_game/utils/utils.dart';
import 'package:fib_game/widgets/widgets.dart';
import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({
    this.showDebugLines = true,
    this.borderThickness = 2,
    this.gridGuideThickness = 1,
    required this.game,
    super.key,
  });

  final FibGame game;
  final bool showDebugLines;
  final double borderThickness;
  final double gridGuideThickness;

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final children = <Widget>[];
        final insideBorderConstraints = BoxConstraints.expand(
          height: constraints.maxHeight - widget.borderThickness * 2,
          width: constraints.maxWidth - widget.borderThickness * 2,
        );

        children.addAll(_buildBorders(constraints));
        children.addAll(_buildGridGuide(insideBorderConstraints));
        children.addAll(
          _buildNumbers(insideBorderConstraints, widget.game.state),
        );

        return Stack(children: children);
      },
    );
  }

  List<Widget> _buildGridGuide(BoxConstraints constraints) {
    return [
      ...(widget.game.state.numCols - 1).build<GridGuideline>(
        (index) => GridGuideline(
          boardSize: constraints.biggest,
          borderThickness: widget.borderThickness,
          direction: Direction.vertical,
          index: index,
          numCols: widget.game.state.numCols,
          numRows: widget.game.state.numRows,
          size: Size(widget.gridGuideThickness, constraints.maxHeight),
          key: ValueKey('vertical-$index'),
        ),
      ),
      ...(widget.game.state.numRows - 1).build<GridGuideline>(
        (index) => GridGuideline(
          boardSize: constraints.biggest,
          borderThickness: widget.borderThickness,
          direction: Direction.horizontal,
          index: index,
          numCols: widget.game.state.numCols,
          numRows: widget.game.state.numRows,
          size: Size(constraints.maxWidth, widget.gridGuideThickness),
          key: ValueKey('horizontal-$index'),
        ),
      ),
    ];
  }

  List<Widget> _buildBorders(BoxConstraints constraints) {
    return Origin.values
        .map<BoardBorder>(
          (origin) => BoardBorder(
            side: origin,
            boardSize: Size(constraints.maxHeight, constraints.maxWidth),
            isActive: origin == widget.game.state.nextNumberOrigin,
            thickness: widget.borderThickness,
          ),
        )
        .toList();
  }

  List<Widget> _buildNumbers(BoxConstraints constraints, GameState state) {
    final cellHeight =
        (constraints.maxHeight - (widget.gridGuideThickness * state.numCols)) /
            state.numCols;
    final cellWidth =
        (constraints.maxWidth - (widget.gridGuideThickness * state.numRows)) /
            state.numRows;

    final numbers = <Widget>[];
    for (final (int rowIndex, List<int?> row) in state.board.rowsIndexed) {
      for (final (int colIndex, int? number) in row.indexed) {
        if (number != null) {
          numbers.add(
            Positioned(
              top: ((cellHeight + widget.gridGuideThickness) * rowIndex) +
                  widget.borderThickness,
              left: ((cellWidth + widget.gridGuideThickness) * colIndex) +
                  widget.borderThickness,
              height: cellHeight,
              width: cellWidth,
              child: Center(
                child: Text(number.toString()),
              ),
            ),
          );
        }
      }
    }
    return numbers;
  }
}
