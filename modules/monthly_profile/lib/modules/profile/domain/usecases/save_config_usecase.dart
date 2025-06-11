import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_profile/modules/profile/domain/repository/profile_repository.dart';

abstract class SaveConfigUsecase {
  Future<Result<bool>> call(AppConfigEntity appConfig);
}

class SaveConfigUsecaseImpl implements SaveConfigUsecase {
  SaveConfigUsecaseImpl({required this.repository});

  final ProfileRepository repository;

  @override
  Future<Result<bool>> call(AppConfigEntity appConfig) async {
    try {
      await repository.save(appConfig);
      return const Success(true);
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
