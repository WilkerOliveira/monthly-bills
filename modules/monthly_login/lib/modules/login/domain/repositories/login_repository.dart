import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_login/core/exceptions/login_failure.dart';
import 'package:monthly_login/modules/login/domain/entities/user_entity.dart';

abstract class LoginRepository {
  Future<ResultDart<UserEntity, LoginFailure>> login();
  Future<ResultDart<bool, LoginFailure>> logout();
  UserEntity? getCurrentUser();
}
