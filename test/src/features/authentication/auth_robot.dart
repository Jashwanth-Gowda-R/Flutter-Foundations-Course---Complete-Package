import 'package:ecommerce_app/src/features/authentication/presentation/account/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class AuthRobot {
  AuthRobot(this.tester);
  final WidgetTester tester;

  Future<void> pumpAccountScreen() async {
    await tester.pumpWidget(
      const ProviderScope(
          child: MaterialApp(
        home: AccountScreen(),
      )),
    );
  }

  Future<void> tapLogoutButton() async {
    final logoutButton = find.text("Logout");
    expect(logoutButton, findsOneWidget);
    await tester.tap(logoutButton);
    await tester.pump();
  }

  void expectLogoutDialogFound() {
    final dialogTitle = find.text("Are you sure?");
    expect(dialogTitle, findsOneWidget);
  }

  Future<void> tapCancelButton() async {
    final cancelTitle = find.text("Cancel");
    expect(cancelTitle, findsOneWidget);
    await tester.tap(cancelTitle);
    await tester.pump();
  }

  void expectLogoutDialogNotFound() {
    final dialogTitle = find.text("Are you sure?");
    expect(dialogTitle, findsNothing);
  }
}
