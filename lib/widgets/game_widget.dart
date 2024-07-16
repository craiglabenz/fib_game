import 'package:fib_game/game/game.dart';
import 'package:fib_game/widgets/widgets.dart';
import 'package:flutter/widgets.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({super.key});

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  FibGame game = FibGame(GameState.initial());

  @override
  Widget build(BuildContext context) {
    return GameArea(game: game);
  }
}
