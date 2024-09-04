part of 'home_bloc.dart';

abstract class HomeEvent {}

class LoadData implements HomeEvent {}

class ChangeCategory implements HomeEvent {
  final String category;

  ChangeCategory({
    required this.category,
  });
}

class LoadTrashData implements HomeEvent {}

class LoadDumpsData implements HomeEvent {}

class LoadForestData implements HomeEvent {}

class LoadPermitsData implements HomeEvent {}

class ReloadPage implements HomeEvent {}
