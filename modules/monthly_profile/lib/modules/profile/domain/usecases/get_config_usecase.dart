import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart';
import 'package:monthly_profile/modules/profile/domain/repository/profile_repository.dart';

abstract class GetConfigUsecase {
  Future<Result<AppConfigEntity>> call();
}

class GetConfigUsecaseImpl implements GetConfigUsecase {
  GetConfigUsecaseImpl({required this.repository});

  final ProfileRepository repository;

  @override
  Future<Result<AppConfigEntity>> call() async {
    try {
      final appConfig = await repository.getOrCreateAppConfig();
      return Success(appConfig);
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
