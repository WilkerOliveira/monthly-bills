import 'package:monthly_dependencies/monthly_dependencies.dart';
import 'package:monthly_domain/monthly_domain.dart';

sealed class ProfileState extends Equatable {}

class ProfileLoadingState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileInititalState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileErrorState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoadedState extends ProfileState {
  ProfileLoadedState({required this.appConfig});

  final AppConfigEntity appConfig;

  @override
  List<Object?> get props => [appConfig];
}

class ProfileSuccessState extends ProfileState {
  @override
  List<Object?> get props => [];
}
