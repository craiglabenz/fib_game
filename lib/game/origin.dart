import 'dart:math';

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
}
