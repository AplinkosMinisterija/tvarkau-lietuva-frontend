part of 'information_bloc.dart';

abstract class InformationEvent {}

class LoadData implements InformationEvent {
  final String refId;

  LoadData({
    required this.refId,
  });
}

class ReloadPage implements InformationEvent {}
