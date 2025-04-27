import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_login/core/translation/login_strings.dart';

class MockLoginStrings extends Mock implements LoginStrings {
  @override
  String get loginAppName => 'Controle de Despesas';

  @override
  String get loginAppNameDesc => 'Gerencie seus gastos de forma inteligente.';

  @override
  String get loginButtonTitle => 'Entrar com Google';

  @override
  String get somethingWentWrong =>
      'Não foi possível realizar o login. Tente novamente.';

  @override
  String get loginSuccessMessage => 'Login realizado com sucesso';
}
