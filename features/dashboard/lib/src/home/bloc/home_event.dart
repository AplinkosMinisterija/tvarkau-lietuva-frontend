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

class LoadSystemErrorReport implements HomeEvent {}

class SendSystemErrorReport implements HomeEvent {
  final String email;
  final String description;
  final List<Uint8List>? images;

  SendSystemErrorReport({
    required this.email,
    required this.description,
    this.images,
  });
}

class ReloadPage implements HomeEvent {}
