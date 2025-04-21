import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_login/core/exceptions/login_failure.dart';
import 'package:monthly_login/modules/login/data/datasources/firebase_datasource.dart';
import 'package:monthly_login/modules/login/domain/entities/user_entity.dart';
import 'package:monthly_login/modules/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({required this.loginDatasource});

  final FirebaseDatasource loginDatasource;

  @override
  Future<ResultDart<UserEntity, LoginFailure>> login() async {
    try {
      final userModel = await loginDatasource.signInWithGoogle();
      final userEntity = userModel.toEntity();
      return Success(userEntity);
    } on FirebaseAuthException catch (e) {
      return Failure(_handleFirebaseAuthError(e));
    } on Exception catch (_) {
      return Failure(ServerFailure());
    }
  }

  @override
  Future<ResultDart<bool, LoginFailure>> logout() async {
    try {
      await loginDatasource.signOut();
      return const Success(true);
    } on Exception catch (_) {
      return Failure(ServerFailure());
    }
  }

  @override
  UserEntity? getCurrentUser() {
    final userModel = loginDatasource.getCurrentUser();
    if (userModel == null) {
      return null;
    }
    return userModel.toEntity();
  }

  LoginFailure _handleFirebaseAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'account-exists-with-different-credential':
        return AccountExistsWithDifferentCredentialFailure();
      case 'invalid-credential':
        return InvalidCredentialFailure();
      case 'operation-not-allowed':
        return OperationNotAllowedFailure();
      case 'user-disabled':
        return UserDisabledFailure();
      case 'user-not-found':
        return UserNotFoundFailure();
      case 'wrong-password':
        return WrongPasswordFailure();
      case 'invalid-verification-code':
        return InvalidVerificationCodeFailure();
      case 'invalid-verification-id':
        return InvalidVerificationIdFailure();
      case 'quota-exceeded':
        return QuotaExceededFailure();
      case 'network-request-failed':
        return NetworkFailure();
      default:
        return ServerFailure();
    }
  }
}
