part of 'home_bloc.dart';

abstract class HomeEvent {}

class LoadData implements HomeEvent {
  final String type;

  LoadData({
    required this.type,
  });
}

class ReloadPage implements HomeEvent {
  final String type;

  ReloadPage({
    required this.type,
  });
}
