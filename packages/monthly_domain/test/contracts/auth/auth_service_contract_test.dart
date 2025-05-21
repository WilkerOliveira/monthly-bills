import 'package:flutter_test/flutter_test.dart';
import 'package:monthly_domain/contracts/auth/auth_service_contract.dart';
import 'package:monthly_domain/entities/user.dart';

class MockAuthService implements AuthServiceContract {
  bool _isLoggedIn = false;
  User? _currentUser;

  @override
  bool get isLoggedIn => _isLoggedIn;

  @override
  User? get currentUser => _currentUser;

  void logIn(User user) {
    _isLoggedIn = true;
    _currentUser = user;
  }

  @override
  Future<void> signOut() async {
    _isLoggedIn = false;
    _currentUser = null;
  }
}

void main() {
  group('AuthServiceContract', () {
    late MockAuthService authService;
    final testUser = User(
      name: 'Test User',
      email: 'test@example.com',
      uid: '1',
      photoUrl: 'http://example.com/photo.jpg',
    );

    setUp(() {
      authService = MockAuthService();
    });

    test('initial state is not logged in and currentUser is null', () {
      expect(authService.isLoggedIn, isFalse);
      expect(authService.currentUser, isNull);
    });

    test('logIn sets isLoggedIn to true and sets currentUser', () {
      authService.logIn(testUser);
      expect(authService.isLoggedIn, isTrue);
      expect(authService.currentUser, equals(testUser));
    });

    test('signOut resets isLoggedIn and currentUser', () async {
      authService.logIn(testUser);
      await authService.signOut();
      expect(authService.isLoggedIn, isFalse);
      expect(authService.currentUser, isNull);
    });
  });
}
