part of 'removed_bloc.dart';

abstract class RemovedEvent {}

class LoadData implements RemovedEvent {}

class ReloadPage implements RemovedEvent {}

class UpdateReport implements RemovedEvent {
  final String id;
  final String refId;
  final String name;
  final double reportLong;
  final double reportLat;
  final String status;
  final String comment;
  final String isVisible;
  final String isDeleted;
  final String editor;
  final List<String> imageUrls;
  final List<String> officerImageUrls;

  final List<dio.MultipartFile> officerImageFiles;

  UpdateReport({
    required this.id,
    required this.refId,
    required this.name,
    required this.reportLong,
    required this.reportLat,
    required this.status,
    required this.comment,
    required this.isVisible,
    required this.isDeleted,
    required this.editor,
    required this.imageUrls,
    required this.officerImageUrls,

    required this.officerImageFiles,
  });
}
