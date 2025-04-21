import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_login/modules/login/data/models/user_model.dart';

abstract class FirebaseDatasource {
  Future<UserModel> signInWithGoogle();
  Future<void> signOut();
  UserModel? getCurrentUser();
}

class FirebaseDatasourceImpl implements FirebaseDatasource {
  FirebaseDatasourceImpl({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  }) : _firebaseAuth = firebaseAuth,
       _googleSignIn = googleSignIn;

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  @override
  Future<UserModel> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();

    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    return UserModel.fromFirebase(userCredential.user!);
  }

  @override
  Future<void> signOut() {
    _googleSignIn.signOut();
    return _firebaseAuth.signOut();
  }

  @override
  UserModel? getCurrentUser() {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      return null;
    }
    return UserModel.fromFirebase(user);
  }
}
