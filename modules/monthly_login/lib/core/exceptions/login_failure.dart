abstract class LoginFailure implements Exception {
  LoginFailure({this.message = ''});
  final String message;
}

class ServerFailure extends LoginFailure {
  ServerFailure({super.message = 'Server error occurred'});
}

class CacheFailure extends LoginFailure {
  CacheFailure({super.message = 'Cache error occurred'});
}

class NetworkFailure extends LoginFailure {
  NetworkFailure({super.message = 'Network error occurred'});
}

class TimeoutFailure extends LoginFailure {
  TimeoutFailure({super.message = 'Request timed out'});
}

class InvalidCredentialFailure extends LoginFailure {
  InvalidCredentialFailure({super.message = 'Invalid credentials'});
}

class UserNotFoundFailure extends LoginFailure {
  UserNotFoundFailure({super.message = 'User not found'});
}

class WrongPasswordFailure extends LoginFailure {
  WrongPasswordFailure({super.message = 'Wrong password'});
}

class UserDisabledFailure extends LoginFailure {
  UserDisabledFailure({super.message = 'User disabled'});
}

class OperationNotAllowedFailure extends LoginFailure {
  OperationNotAllowedFailure({super.message = 'Operation not allowed'});
}

class AccountExistsWithDifferentCredentialFailure extends LoginFailure {
  AccountExistsWithDifferentCredentialFailure({
    super.message = 'Account exists with different credential',
  });
}

class InvalidVerificationCodeFailure extends LoginFailure {
  InvalidVerificationCodeFailure({super.message = 'Invalid verification code'});
}

class InvalidVerificationIdFailure extends LoginFailure {
  InvalidVerificationIdFailure({super.message = 'Invalid verification ID'});
}

class QuotaExceededFailure extends LoginFailure {
  QuotaExceededFailure({super.message = 'Quota exceeded'});
}

class InvalidRequestFailure extends LoginFailure {
  InvalidRequestFailure({super.message = 'Invalid request'});
}

class UnauthorizedFailure extends LoginFailure {
  UnauthorizedFailure({super.message = 'Unauthorized'});
}

class AccessDeniedFailure extends LoginFailure {
  AccessDeniedFailure({super.message = 'Access denied'});
}
