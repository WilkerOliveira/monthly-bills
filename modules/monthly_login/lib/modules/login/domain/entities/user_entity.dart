import 'package:monthly_dependencies/monthly_dependencies.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.email,
    this.name,
    this.photoUrl,
  });
  final String id;
  final String email;
  final String? name;
  final String? photoUrl;

  @override
  List<Object?> get props => [id, email, name, photoUrl];
}
