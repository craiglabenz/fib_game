import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({
    this.showDebugLines = true,
    this.borderThickness = 2,
    super.key,
  });

  final bool showDebugLines;
  final double borderThickness;

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
        if (widget.showDebugLines) {
          children.addAll(_buildDebugLines(insideBorderConstraints));
        }

        return Stack(
          children: children,
        );
      },
    );
  }

  List<Widget> _buildDebugLines(BoxConstraints constraints) {
    return [
      // First vertical
      Positioned(
        top: widget.borderThickness,
        left: constraints.maxWidth * 0.25,
        height: constraints.maxHeight,
        width: 1,
        child: const ColoredBox(color: Colors.grey),
      ),
      // Second vertical
      Positioned(
        top: widget.borderThickness,
        left: constraints.maxWidth * 0.5,
        height: constraints.maxHeight,
        width: 1,
        child: const ColoredBox(color: Colors.grey),
      ),
      // Third vertical
      Positioned(
        top: widget.borderThickness,
        left: constraints.maxWidth * 0.75,
        height: constraints.maxHeight,
        width: 1,
        child: const ColoredBox(color: Colors.grey),
      ),
      // First horizontal
      Positioned(
        top: constraints.maxHeight * 0.25,
        left: widget.borderThickness,
        height: 1,
        width: constraints.maxWidth,
        child: const ColoredBox(color: Colors.grey),
      ),
      // Second horizontal
      Positioned(
        top: constraints.maxHeight * 0.5,
        left: widget.borderThickness,
        height: 1,
        width: constraints.maxWidth,
        child: const ColoredBox(color: Colors.grey),
      ),
      // Third horizontal
      Positioned(
        top: constraints.maxHeight * 0.75,
        left: widget.borderThickness,
        height: 1,
        width: constraints.maxWidth,
        child: const ColoredBox(color: Colors.grey),
      ),
    ];
  }

  List<Widget> _buildBorders(BoxConstraints constraints) {
    return [
      // Top border
      Positioned(
        top: 0,
        left: 0,
        height: 2,
        width: constraints.maxWidth,
        child: const ColoredBox(color: Colors.blue),
      ),
      // Left border
      Positioned(
        top: 0,
        left: 0,
        width: 2,
        height: constraints.maxHeight,
        child: const ColoredBox(color: Colors.blue),
      ),
      // Right border
      Positioned(
        top: 0,
        right: 0,
        width: 2,
        height: constraints.maxHeight,
        child: const ColoredBox(color: Colors.blue),
      ),
      // Bottom border
      Positioned(
        bottom: 0,
        left: 0,
        height: 2,
        width: constraints.maxWidth,
        child: const ColoredBox(color: Colors.blue),
      ),
    ];
  }
}
