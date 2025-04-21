import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_login/modules/login/domain/usecases/login_usecase.dart';
import 'package:monthly_login/modules/login/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUsecase}) : super(LoginInitialState());

  final LoginUsecase loginUsecase;

  Future<void> login() async {
    emit(LoginLoadingState());

    final loginResult = await loginUsecase();
    loginResult.fold(
      (success) => emit(LoginSuccessState()),
      (failure) => emit(LoginErrorState()),
    );
  }
}
