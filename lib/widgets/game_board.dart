import 'package:fib_game/game/game.dart';
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

        return Stack(
          children: children,
        );
      },
    );
  }

  List<Widget> _buildGridGuide(BoxConstraints constraints) {
    return [
      // First vertical
      Positioned(
        top: widget.borderThickness,
        left: constraints.maxWidth * 0.25,
        height: constraints.maxHeight,
        width: widget.gridGuideThickness,
        child: const ColoredBox(color: Colors.grey),
      ),
      // Second vertical
      Positioned(
        top: widget.borderThickness,
        left: constraints.maxWidth * 0.5,
        height: constraints.maxHeight,
        width: widget.gridGuideThickness,
        child: const ColoredBox(color: Colors.grey),
      ),
      // Third vertical
      Positioned(
        top: widget.borderThickness,
        left: constraints.maxWidth * 0.75,
        height: constraints.maxHeight,
        width: widget.gridGuideThickness,
        child: const ColoredBox(color: Colors.grey),
      ),
      // First horizontal
      Positioned(
        top: constraints.maxHeight * 0.25,
        left: widget.borderThickness,
        height: widget.gridGuideThickness,
        width: constraints.maxWidth,
        child: const ColoredBox(color: Colors.grey),
      ),
      // Second horizontal
      Positioned(
        top: constraints.maxHeight * 0.5,
        left: widget.borderThickness,
        height: widget.gridGuideThickness,
        width: constraints.maxWidth,
        child: const ColoredBox(color: Colors.grey),
      ),
      // Third horizontal
      Positioned(
        top: constraints.maxHeight * 0.75,
        left: widget.borderThickness,
        height: widget.gridGuideThickness,
        width: constraints.maxWidth,
        child: const ColoredBox(color: Colors.grey),
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
    for (final (int rowIndex, List<int?> row) in state.board.indexed) {
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
