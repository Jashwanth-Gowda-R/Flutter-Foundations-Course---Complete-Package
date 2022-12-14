import 'package:flutter_test/flutter_test.dart';

import '../../auth_robot.dart';

void main() {
  testWidgets('cancel logout', (tester) async {
    // await tester.pumpWidget(
    //   const ProviderScope(
    //       child: MaterialApp(
    //     home: AccountScreen(),
    //   )),
    // );
    var r = AuthRobot(tester);
    await r.pumpAccountScreen();
    // final logoutButton = find.text("Logout");
    // expect(logoutButton, findsOneWidget);
    // await tester.tap(logoutButton);
    // await tester.pump();
    await r.tapLogoutButton();
    // final dialogTitle = find.text("Are you sure?");
    // expect(dialogTitle, findsOneWidget);
    r.expectLogoutDialogFound();
    // final cancelTitle = find.text("Cancel");
    // expect(cancelTitle, findsOneWidget);
    // await tester.tap(cancelTitle);
    // await tester.pump();
    await r.tapCancelButton();
    // expect(dialogTitle, findsNothing);
    r.expectLogoutDialogNotFound();
  });

  testWidgets('Confirm logout success', (tester) async {
    // await tester.pumpWidget(
    //   const ProviderScope(
    //       child: MaterialApp(
    //     home: AccountScreen(),
    //   )),
    // );
    var r = AuthRobot(tester);
    await r.pumpAccountScreen();
    // final logoutButton = find.text("Logout");
    // expect(logoutButton, findsOneWidget);
    // await tester.tap(logoutButton);
    // await tester.pump();
    await r.tapLogoutButton();
    // final dialogTitle = find.text("Are you sure?");
    // expect(dialogTitle, findsOneWidget);
    r.expectLogoutDialogFound();
    // final cancelTitle = find.text("Cancel");
    // expect(cancelTitle, findsOneWidget);
    // await tester.tap(cancelTitle);
    // await tester.pump();
    await r.tapDialogLogoutButton();
    // expect(dialogTitle, findsNothing);
    r.expectLogoutDialogNotFound();
  });
}
