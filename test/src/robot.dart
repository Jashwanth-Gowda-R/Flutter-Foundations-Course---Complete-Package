import 'package:ecommerce_app/src/app.dart';
import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/products/data/fake_products_repository.dart';
import 'package:ecommerce_app/src/features/products/presentation/products_list/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class Robot {
  Robot({
    required this.tester,
  });
  final WidgetTester tester;

  Future<void> pumpMyApp() async {
    // create new repositories with addDelay: false
    final authRepository = FakeAuthRepository(addDelay: false);
    final productsRepository = FakeProductsRepository(addDelay: false);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // use them via provider overrides:
          authRepositoryProvider.overrideWithValue(authRepository),
          productsRepositoryProvider.overrideWithValue(productsRepository),
        ],
        child: const MaterialApp(
          home: MyApp(),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  void expectFindAllProductsCards() {
    var finder = find.byType(ProductCard);
    expect(finder, findsNWidgets(kTestProducts.length));
  }
}
