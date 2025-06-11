import 'package:monthly_database/monthly_database.dart';
import 'package:monthly_domain/entities/app_config_entity.dart';

class AppConfigModel {
  AppConfigModel({required this.startDay, required this.endDay});

  factory AppConfigModel.toModel(AppConfigDbModel dbModel) {
    return AppConfigModel(startDay: dbModel.startDay, endDay: dbModel.endDay);
  }

  factory AppConfigModel.entityToModel(AppConfigEntity entity) {
    return AppConfigModel(startDay: entity.startDay, endDay: entity.endDay);
  }

  final int startDay;
  final int endDay;

  AppConfigEntity toEntity() {
    return AppConfigEntity(startDay: startDay, endDay: endDay);
  }

  AppConfigDbModel toDbModel() {
    return AppConfigDbModel(startDay: startDay, endDay: endDay);
  }
}
