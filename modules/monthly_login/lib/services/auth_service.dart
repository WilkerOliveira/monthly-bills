import 'package:monthly_dependencies/monthly_dependencies.dart';

abstract class AuthService {
  bool isLoggedIn();
}

class AuthServiceImpl implements AuthService {
  AuthServiceImpl({required this.firebaseAuth});

  final FirebaseAuth firebaseAuth;

  @override
  bool isLoggedIn() {
    return firebaseAuth.currentUser != null;
  }
}
