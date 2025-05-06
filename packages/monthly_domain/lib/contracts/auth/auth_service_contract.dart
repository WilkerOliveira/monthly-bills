import 'package:monthly_domain/entities/user.dart';

abstract class AuthServiceContract {
  bool get isLoggedIn;
  User? get currentUser;
  Future<void> signOut();
}
