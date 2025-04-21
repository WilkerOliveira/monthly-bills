abstract class LoginState {}

final class LoginInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  LoginSuccessState();
}

final class LoginErrorState extends LoginState {
  LoginErrorState();
}
