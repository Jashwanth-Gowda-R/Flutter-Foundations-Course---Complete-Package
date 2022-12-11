import 'package:ecommerce_app/src/utils/delay.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';
import 'package:ecommerce_app/src/utils/in_memory_store.dart';

class FakeAuthRepository {
  FakeAuthRepository({
    this.addDelay = true,
  });
  final bool addDelay;

  final _authState = InMemoryStore<AppUser?>(null);

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await delay(addDelay);
    if (currentUser == null) {
      _createNewUser(email);
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    await delay(addDelay);
    if (currentUser == null) {
      _createNewUser(email);
    }
  }

  Future<void> signOut() async {
    await delay(addDelay);
    _authState.value = null;
  }

  Stream<AppUser?> authStateChanges() => _authState.stream;

  AppUser? get currentUser => _authState.value;

  void _createNewUser(String email) {
    _authState.value = AppUser(
      uid: email.split('').reversed.join(''),
      email: email,
    );
  }

  void dispose() => _authState.close();
}

// providers
final authRepositoryProvider = Provider<FakeAuthRepository>((ref) {
  var auth = FakeAuthRepository();
  ref.onDispose(() {
    auth.dispose();
  });
  return auth;
});

final authStateChangeProvider = StreamProvider.autoDispose<AppUser?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
