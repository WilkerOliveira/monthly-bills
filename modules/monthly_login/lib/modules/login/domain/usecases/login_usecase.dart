import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_login/core/exceptions/login_failure.dart';
import 'package:monthly_login/modules/login/domain/entities/user_entity.dart';
import 'package:monthly_login/modules/login/domain/repositories/login_repository.dart';

abstract class LoginUsecase {
  Future<ResultDart<UserEntity, LoginFailure>> call();
}

class LoginUsecaseImpl implements LoginUsecase {
  LoginUsecaseImpl(this.loginRepository);
  final LoginRepository loginRepository;

  @override
  Future<ResultDart<UserEntity, LoginFailure>> call() {
    return loginRepository.login();
  }
}
