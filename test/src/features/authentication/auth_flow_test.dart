import 'package:flutter_test/flutter_test.dart';

import '../../robot.dart';

void main() {
  testWidgets(
    "Sign in and Sign out flow",
    (tester) async {
      var r = Robot(tester);
      await r.pumpMyApp();
      r.expectFindAllProductsCards();
      await r.openPopupMenu();
      await r.auth.openEmailPasswordSignInScreen();
      await r.auth.signInWithEmailAndPassword();
      r.expectFindAllProductsCards();
      await r.openPopupMenu();
      await r.auth.openAccountScreen();
      await r.auth.tapLogoutButton();
      await r.auth.tapDialogLogoutButton();
      r.expectFindAllProductsCards();
    },
  );
}
