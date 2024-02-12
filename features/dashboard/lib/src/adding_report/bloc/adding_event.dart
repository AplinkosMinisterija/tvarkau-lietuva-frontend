part of 'adding_bloc.dart';

abstract class AddingEvent {}

class LoadTrashData implements AddingEvent {}

class LoadForestData implements AddingEvent {}

class AddReport implements AddingEvent {
  final String emailValue;
  final String textValue;
  final double selectedLat;
  final double selectedLong;
  final List<dio.MultipartFile> imageFiles;
  final String category;

  AddReport({
    required this.emailValue,
    required this.textValue,
    required this.selectedLat,
    required this.selectedLong,
    required this.imageFiles,
    required this.category,
  });
}

class ReloadPage implements AddingEvent {}
