import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart' as domain;

class AuthServiceImpl implements domain.AuthServiceContract {
  AuthServiceImpl({required this.firebaseAuth});

  final FirebaseAuth firebaseAuth;

  @override
  domain.User? get currentUser => _getCurrentUser();

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  bool get isLoggedIn => firebaseAuth.currentUser != null;

  domain.User? _getCurrentUser() {
    if (isLoggedIn) {
      return domain.User(
        uid: firebaseAuth.currentUser!.uid,
        email: firebaseAuth.currentUser!.email ?? '-',
        name: firebaseAuth.currentUser!.displayName,
        photoUrl: firebaseAuth.currentUser!.photoURL,
      );
    }

    return null;
  }
}
