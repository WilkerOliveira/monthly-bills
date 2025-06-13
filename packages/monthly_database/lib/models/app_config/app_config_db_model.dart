import 'package:isar/isar.dart';

part 'app_config_db_model.g.dart';

@collection
class AppConfigDbModel {
  AppConfigDbModel({
    required this.startDay,
    required this.endDay,
    this.id = Isar.autoIncrement,
  });

  final Id id;
  final int startDay;
  final int endDay;
}
