import 'dart:ui';

import 'package:ecommerce_app/src/app.dart';
import 'package:flutter_test/flutter_test.dart';

import '../robot.dart';

void main() {
  // define all size variants
  final sizeVariant = ValueVariant<Size>({
    const Size(300, 600),
    const Size(600, 800),
    const Size(1000, 1000),
  });
  testWidgets(
    "Golden tests",
    (WidgetTester tester) async {
      var r = Robot(tester);
      // get the current size
      final currentSize = sizeVariant.currentValue!;
      // use it to set the surface size
      await r.golden.setSurfaceSize(currentSize);
      await r.golden.loadRobotoFont();
      await r.golden.loadMaterialIconFont();
      await r.pumpMyApp();
      await r.golden.precacheImages();
      await expectLater(
        find.byType(MyApp),
        matchesGoldenFile(
          // 'products_list.png',
          // generate different output goldens based on the width and height
          'products_list_${currentSize.width.toInt()}x${currentSize.height.toInt()}.png',
        ),
      );
    },
    // pass the variant
    variant: sizeVariant,
    tags: ["golden"],
  );
}
