part of 'report_bloc.dart';

abstract class ReportEvent {}

class LoadData implements ReportEvent {
  final String refId;
  LoadData({
    required this.refId,
  });
}

class ReloadPage implements ReportEvent {}

class UpdateReport implements ReportEvent {
  final String id;
  final String refId;
  final String name;
  final double reportLong;
  final double reportLat;
  final String status;
  final String comment;
  final bool isVisible;
  final bool isDeleted;
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
    required this.imageUrls,
    required this.officerImageUrls,
    required this.officerImageFiles,
  });
}
