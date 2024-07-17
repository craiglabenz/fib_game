import 'package:flutter/widgets.dart';

class Position {
  const Position({
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.width,
    this.height,
  });

  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double? width;
  final double? height;

  Positioned toWidget({Key? key, required Widget child}) => Positioned(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        width: width,
        height: height,
        key: key,
        child: child,
      );

  @override
  String toString() =>
      'Position(left: $left, top: $top, right: $right, bottom: $bottom, '
      'width: $width, height: $height)';
}
