import 'dart:math';

enum Origin {
  left,
  top,
  right,
  bottom;

  static Origin get random {
    return <Origin>[
      Origin.left,
      Origin.top,
      Origin.right,
      Origin.bottom
    ][Random().nextInt(4)];
  }
}
