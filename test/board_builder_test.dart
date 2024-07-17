import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fib_game/widgets/board_builder.dart';

void main() {
  group('BoardBuilder should', () {
    test('caculate padding correctly', () {
      final builder = BoardBuilder(
        borderThickness: 2,
        gridGuideThickness: 1,
        numCols: 4,
        numRows: 4,
        padding: const EdgeInsets.all(10),
        windowSize: const Size(100, 100),
      );
      expect(builder.paddingRaw.left, 10);
      expect(builder.paddingRaw.right, 10);
      expect(builder.paddingRaw.top, 10);
      expect(builder.paddingRaw.bottom, 10);
      expect(builder.gameAreaOffset, const Size.square(10));
      expect(builder.gameAreaSize, const Size.square(80));
    });

    test('caculate irregular padding correctly', () {
      final builder = BoardBuilder(
        borderThickness: 2,
        gridGuideThickness: 1,
        numCols: 4,
        numRows: 4,
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 20),
        windowSize: const Size(100, 100),
      );
      expect(builder.paddingRaw.left, 10);
      expect(builder.paddingRaw.right, 10);
      expect(builder.paddingRaw.top, 15);
      expect(builder.paddingRaw.bottom, 20);
      expect(builder.gameAreaOffset, const Size(10, 15));
      expect(builder.gameAreaSize.height, closeTo(65, 0.001));
      expect(builder.gameAreaSize.width, closeTo(65, 0.001));
    });
  });
}
