import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../test/src/robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
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
