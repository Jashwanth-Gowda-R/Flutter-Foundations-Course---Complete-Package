import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/data/fake_products_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  FakeProductsRepository makeFakeProductsRepository() =>
      FakeProductsRepository(addDelay: false);
  group(
    "FakeProductsRepository",
    (() {
      test(
        "getProductsList returns global list",
        () {
          final productsRepository = makeFakeProductsRepository();
          expect(productsRepository.getProductsList(), kTestProducts);
        },
      );

      test(
        "getProduct(1) should return 1st item",
        (() {
          final productsRepository = makeFakeProductsRepository();
          expect(productsRepository.getProduct('1'), kTestProducts[0]);
        }),
      );

      test(
        "getProduct(100) should return null",
        (() {
          final productsRepository = makeFakeProductsRepository();
          expect(productsRepository.getProduct('100'), null);
        }),
      );
      test(
        "fetchProductsList returns global list",
        (() async {
          final productsRepository = makeFakeProductsRepository();
          expect(
            await productsRepository.fetchProductsList(),
            kTestProducts,
          );
        }),
      );

      test(
        "watchProductsList emits global list",
        (() {
          final productsRepository = makeFakeProductsRepository();
          expect(
            productsRepository.watchProductsList(),
            emits(kTestProducts),
          );
        }),
      );

      test(
        "watchProduct(1) should return 1st item",
        (() {
          final productsRepository = makeFakeProductsRepository();
          expect(
            productsRepository.watchProduct('1'),
            emits(kTestProducts[0]),
          );
        }),
      );

      test(
        "watchProduct(100) should return null",
        (() {
          final productsRepository = makeFakeProductsRepository();
          expect(productsRepository.watchProduct('100'), emits(null));
        }),
      );
    }),
  );
}
