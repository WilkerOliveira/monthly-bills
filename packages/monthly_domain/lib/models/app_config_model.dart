import 'package:monthly_database/monthly_database.dart';
import 'package:monthly_domain/entities/app_config_entity.dart';

class AppConfigModel {
  AppConfigModel({required this.startDay, required this.endDay, this.id});

  factory AppConfigModel.toModel(AppConfigDbModel dbModel) {
    return AppConfigModel(
      id: dbModel.id,
      startDay: dbModel.startDay,
      endDay: dbModel.endDay,
    );
  }

  factory AppConfigModel.entityToModel(AppConfigEntity entity) {
    return AppConfigModel(
      id: entity.id,
      startDay: entity.startDay,
      endDay: entity.endDay,
    );
  }

  final int startDay;
  final int endDay;
  final int? id;

  AppConfigEntity toEntity() {
    return AppConfigEntity(id: id, startDay: startDay, endDay: endDay);
  }

  AppConfigDbModel toDbModel() {
    return AppConfigDbModel(id: id, startDay: startDay, endDay: endDay);
  }
}
