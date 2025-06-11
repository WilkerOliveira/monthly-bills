import 'package:isar/isar.dart';

part 'app_config_db_model.g.dart';

@collection
class AppConfigDbModel {
  AppConfigDbModel({required this.startDay, required this.endDay});

  final Id id = Isar.autoIncrement;
  final int startDay;
  final int endDay;
}
