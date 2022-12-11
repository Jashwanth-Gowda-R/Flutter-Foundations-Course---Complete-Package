import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testEmail = 'test@test.com';
  const testPassword = '1234';
  final testUser = AppUser(
    uid: testEmail.split('').reversed.join(),
    email: testEmail,
  );
  FakeAuthRepository makeFakeAuthRepository() =>
      FakeAuthRepository(addDelay: false);
  group("FakeAuthRepository", () {
    test(
      "Current user is null",
      (() {
        final authRepository = makeFakeAuthRepository();
        expect(authRepository.currentUser, null);
        expect(
          authRepository.authStateChanges(),
          emits(null),
        );
      }),
    );

    test(
      "Current user is not null when user is signed in",
      (() async {
        final authRepository = makeFakeAuthRepository();
        await authRepository.signInWithEmailAndPassword(
            testEmail, testPassword);
        expect(authRepository.currentUser, testUser);
        expect(
          authRepository.authStateChanges(),
          emits(testUser),
        );
      }),
    );
  });
}
