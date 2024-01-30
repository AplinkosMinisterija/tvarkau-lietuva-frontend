part of 'adding_bloc.dart';

abstract class AddingEvent {}

class LoadData implements AddingEvent {}

class AddReport implements AddingEvent {
  final String emailValue;
  final String textValue;
  final double selectedLat;
  final double selectedLong;
  final List<Uint8List> images;

  AddReport({
    required this.emailValue,
    required this.textValue,
    required this.selectedLat,
    required this.selectedLong,
    required this.images,
  });
}

class ReloadPage implements AddingEvent {}
