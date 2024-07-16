import 'package:fib_game/game/game.dart';
import 'package:fib_game/utils/utils.dart';
import 'package:fib_game/widgets/widgets.dart';
import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({
    this.showDebugLines = true,
    this.gridGuideThickness = 1,
    required this.borderThickness,
    required this.game,
    required this.squareSize,
    super.key,
  });

  final FibGame game;
  final bool showDebugLines;
  final double borderThickness;
  final double gridGuideThickness;
  final Size squareSize;

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

        children.addAll(_buildGridGuide(insideBorderConstraints));
        children.addAll(_buildBorders(constraints));
        children.addAll(
          _buildNumbers(insideBorderConstraints, widget.game.state),
        );

        return Stack(children: children);
      },
    );
  }

  List<Widget> _buildGridGuide(BoxConstraints constraints) {
    final widgets = [
      ...(widget.game.state.board.numCols).build<GridGuideline>(
        (index) => GridGuideline(
          borderThickness: widget.borderThickness,
          direction: Direction.vertical,
          index: index,
          numGuides: widget.game.state.board.numCols,
          size: Size(widget.gridGuideThickness, constraints.maxHeight),
          squareSize: widget.squareSize,
        ),
      ),
      ...(widget.game.state.board.numRows).build<GridGuideline>(
        (index) => GridGuideline(
          borderThickness: widget.borderThickness,
          direction: Direction.horizontal,
          index: index,
          numGuides: widget.game.state.board.numRows,
          size: Size(constraints.maxWidth, widget.gridGuideThickness),
          squareSize: widget.squareSize,
        ),
      ),
    ];
    return widgets;
  }

  List<Widget> _buildBorders(BoxConstraints constraints) {
    return Origin.values
        .map<BoardBorder>(
          (origin) => BoardBorder(
            side: origin,
            boardSize: Size(constraints.maxWidth, constraints.maxHeight),
            isActive: origin == widget.game.state.nextNumberOrigin,
            thickness: widget.borderThickness,
          ),
        )
        .toList();
  }

  List<Widget> _buildNumbers(BoxConstraints constraints, GameState state) {
    final innerSquareSize = Size(
      widget.squareSize.width - (widget.gridGuideThickness * 2) + 1,
      widget.squareSize.height - (widget.gridGuideThickness * 2) + 1,
    );

    final numbers = <Widget>[];
    for (final (int rowIndex, List<int?> row) in state.board.rowsIndexed) {
      for (final (int colIndex, int? number) in row.indexed) {
        if (number != null) {
          numbers.add(
            Positioned(
              top: (widget.squareSize.height * rowIndex) +
                  widget.borderThickness +
                  // Add space for the undrawn top grey border
                  widget.gridGuideThickness,
              left: (widget.squareSize.width * colIndex) +
                  widget.borderThickness +
                  // Add space for the undrawn left grey border
                  widget.gridGuideThickness,
              height: innerSquareSize.height,
              width: innerSquareSize.width,
              child: Container(
                decoration: widget.showDebugLines
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
