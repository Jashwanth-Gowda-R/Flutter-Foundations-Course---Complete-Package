import 'package:ecommerce_app/src/features/authentication/presentation/account/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('cancel logout', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
          child: MaterialApp(
        home: AccountScreen(),
      )),
    );
    final logoutButton = find.text("Logout");
    expect(logoutButton, findsOneWidget);
    await tester.tap(logoutButton);
    await tester.pump();
    final dialogTitle = find.text("Are you sure?");
    expect(dialogTitle, findsOneWidget);
    final cancelTitle = find.text("Cancel");
    expect(cancelTitle, findsOneWidget);
    await tester.tap(cancelTitle);
    await tester.pump();
    expect(dialogTitle, findsNothing);
  });
}
