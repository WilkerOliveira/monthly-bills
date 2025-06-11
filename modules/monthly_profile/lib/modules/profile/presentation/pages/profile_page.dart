import 'package:flutter/material.dart';
import 'package:monthly_common/monthly_common.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_profile/core/translation/profile_strings.dart';
import 'package:monthly_profile/modules/profile/presentation/cubit/profile_cubit.dart';
import 'package:monthly_profile/modules/profile/presentation/cubit/profile_state.dart';
import 'package:monthly_profile/modules/profile/presentation/widgets/header_widget.dart';
import 'package:monthly_ui_components/monthly_ui_components.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with FormValidationsMixin {
  late ProfileStrings strings;

  AppConfigEntity _appConfigEntity = AppConfigEntity.empty();
  late ProfileCubit _cubit;
  @override
  void initState() {
    super.initState();
    _cubit = MonthlyDI.I.get<ProfileCubit>()..loadConfigs();
    strings = MonthlyDI.I.get<ProfileStrings>();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(strings.profileTitle),
          actions: [
            GestureDetector(
              child: const Icon(Icons.save),
              onTap: () {
                _cubit.save(_appConfigEntity);
              },
            ),
          ],
        ),
        body: BasePage(
          child: Column(
            children: [
              const HeaderWidget(),
              const Divider(thickness: 0.8),
              SizedBox(height: vSmallSpace),
              Text(
                strings.configDateDescription,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: subTitleTextSize,
                ),
              ),
              SizedBox(height: vNormalSpace),
              BlocConsumer<ProfileCubit, ProfileState>(
                bloc: _cubit,
                listener: (context, state) {
                  if (state is ProfileSuccessState) {
                    MonthlySnackBar.success(
                      context,
                      message: strings.savedSuccessfully,
                    );
                  } else if (state is ProfileErrorState) {
                    MonthlySnackBar.error(
                      context,
                      message: strings.errorSaveMessage,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ProfileErrorState) {
                    return const ErrorStateWidget();
                  }

                  if (state is ProfileLoadingState) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: vLargeSpace),
                      child: const LoadingStateWidget(),
                    );
                  }

                  if (state is ProfileLoadedState) {
                    _appConfigEntity = state.appConfig;
                  }
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: DaysDropdownWidget(
                              label: strings.startDay,
                              inititalValue: _appConfigEntity.startDay,
                              onSelected: (int? day) {
                                _appConfigEntity = _appConfigEntity.copyWith(
                                  startDay: day,
                                );
                              },
                            ),
                          ),
                          SizedBox(width: vSmallSpace),
                          Expanded(
                            child: DaysDropdownWidget(
                              label: strings.endDay,
                              inititalValue: _appConfigEntity.endDay,
                              onSelected: (int? day) {
                                _appConfigEntity = _appConfigEntity.copyWith(
                                  endDay: day,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: vNormalSpace),
            ],
          ),
        ),
      ),
    );
  }
}
