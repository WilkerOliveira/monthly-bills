import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_login/modules/login/presentation/cubit/login_cubit.dart';
import 'package:monthly_login/modules/login/presentation/cubit/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = MonthlyDI.I.get<LoginCubit>();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      bloc: cubit,
      listener: (context, state) {
        if (state is LoginErrorState) {
          MonthlySnackBar.error(
            context,
            message: 'Não foi possível realizar o login. Tente novamente.',
          );
        }
        if (state is LoginSuccessState) {
          MonthlySnackBar.success(
            context,
            message: 'Login realizado com sucesso',
          );
          context.go(MainRoutes.home);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                const Spacer(),
                const Icon(
                  Icons.account_balance_wallet_rounded,
                  size: 80,
                  color: Colors.greenAccent,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Controle de Despesas',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Gerencie seus gastos de forma inteligente.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 40),
                Visibility(
                  visible: state is! LoginLoadingState,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => cubit.login(),
                      icon: SvgPicture.asset(
                        'assets/icons/google.svg',
                        package: 'monthly_login',
                        height: 24,
                      ),
                      label: const Text(
                        'Entrar com Google',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: state is LoginLoadingState,
                  child: const CircularProgressIndicator(),
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
