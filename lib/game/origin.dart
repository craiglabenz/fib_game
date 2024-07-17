import 'dart:math';
import 'direction.dart';

enum Origin {
  left,
  top,
  right,
  bottom;

  static Origin random([Random? rnd]) {
    return <Origin>[
      Origin.left,
      Origin.top,
      Origin.right,
      Origin.bottom
    ][(rnd ?? Random()).nextInt(4)];
  }

  Direction get direction => switch (this) {
        Origin.left => Direction.vertical,
        Origin.right => Direction.vertical,
        Origin.top => Direction.horizontal,
        Origin.bottom => Direction.horizontal,
      };
}
