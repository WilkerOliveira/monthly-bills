import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_login/core/translation/login_strings.dart';
import 'package:monthly_login/modules/login/presentation/cubit/login_cubit.dart';
import 'package:monthly_login/modules/login/presentation/cubit/login_state.dart';
import 'package:monthly_login/modules/login/presentation/widgets/login_image_button.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginCubit cubit;
  late final LoginStrings strings;
  @override
  void initState() {
    super.initState();
    cubit = MonthlyDI.I.get<LoginCubit>();
    strings = MonthlyDI.I.get<LoginStrings>();
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
          MonthlySnackBar.error(context, message: strings.somethingWentWrong);
        }
        if (state is LoginSuccessState) {
          MonthlySnackBar.success(
            context,
            message: strings.loginSuccessMessage,
          );
          context.go(MainRoutes.home);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: BasePage(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: hLargeSpace,
                vertical: vLargeSpace,
              ),
              child: Column(
                children: [
                  const Spacer(),
                  const LogoWidget(),
                  SizedBox(height: vMediumSpace),
                  Text(
                    strings.loginAppName,
                    style: TextStyle(
                      fontSize: titleTextSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: vNormalSpace),
                  Text(
                    strings.loginAppNameDesc,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: subTitleTextSize),
                  ),
                  SizedBox(height: vBigSpace),
                  if (state is! LoginLoadingState)
                    SizedBox(
                      width: screenWidth,
                      child: CustomIconButton(
                        onPressed: () => cubit.login(),
                        icon: const LoginImageButton(),
                        label: strings.loginButtonTitle,
                        fontSize: mediumTextSize,
                      ),
                    )
                  else
                    const CircularProgressIndicator(),

                  const Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
