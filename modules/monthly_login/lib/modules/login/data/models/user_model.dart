import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_login/modules/login/domain/entities/user_entity.dart';

class UserModel {
  UserModel({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.photoURL,
  });
  factory UserModel.fromFirebase(User user) {
    return UserModel(
      uid: user.uid,
      displayName: user.displayName ?? '',
      email: user.email ?? '',
      photoURL: user.photoURL ?? '',
    );
  }

  final String uid;
  final String displayName;
  final String email;
  final String photoURL;

  UserEntity toEntity() {
    return UserEntity(
      id: uid,
      email: email,
      name: displayName,
      photoUrl: photoURL,
    );
  }
}
