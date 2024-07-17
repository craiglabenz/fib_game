import 'dart:math';
import 'package:fib_game/game/game.dart';
import 'package:fib_game/widgets/widgets.dart';
import 'package:flutter/widgets.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({super.key, this.seed});

  final int? seed;

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  late Random rnd;
  late FibGame game;

  @override
  void initState() {
    super.initState();
    rnd = Random(widget.seed);
    game = FibGame(rnd);
    game.initialize(
      GameState(
        board: Board(4, 4)..populate(),
        nextNumber: game.randomNextNumber(),
        nextNumberOrigin: Origin.random(rnd),
        nextNumberPosition: rnd.nextInt(4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GameArea(game: game);
  }
}
