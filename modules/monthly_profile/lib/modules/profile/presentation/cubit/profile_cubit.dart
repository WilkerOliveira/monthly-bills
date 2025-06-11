import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_profile/modules/profile/domain/usecases/get_config_usecase.dart';
import 'package:monthly_profile/modules/profile/domain/usecases/save_config_usecase.dart';
import 'package:monthly_profile/modules/profile/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._saveConfigUsecase, this._getConfigUsecase)
    : super(ProfileInititalState());

  final SaveConfigUsecase _saveConfigUsecase;
  final GetConfigUsecase _getConfigUsecase;

  Future<void> loadConfigs() async {
    emit(ProfileLoadingState());

    try {
      final result = await _getConfigUsecase();

      result.fold((AppConfigEntity configs) {
        emit(ProfileLoadedState(appConfig: configs));
      }, (onFailure) => emit(ProfileErrorState()));
    } on Exception {
      emit(ProfileErrorState());
    }
  }

  Future<void> save(AppConfigEntity config) async {
    emit(ProfileLoadingState());

    try {
      final result = await _saveConfigUsecase(config);

      result.fold((bool success) {
        if (success) {
          emit(ProfileSuccessState());
        } else {
          emit(ProfileErrorState());
        }
      }, (onFailure) => emit(ProfileErrorState()));
    } on Exception {
      emit(ProfileErrorState());
    }
  }
}
