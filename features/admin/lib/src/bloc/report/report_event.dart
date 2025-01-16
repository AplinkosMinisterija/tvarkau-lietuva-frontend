part of 'report_bloc.dart';

abstract class ReportEvent {}

class LoadData implements ReportEvent {
  final String refId;

  LoadData({
    required this.refId,
  });
}

class ReloadPage implements ReportEvent {}

class TransferReport implements ReportEvent {
  final String refId;
  final String name;
  final double longitude;
  final double latitude;
  final String status;
  final DateTime reportDate;
  final String email;

  TransferReport({
    required this.refId,
    required this.name,
    required this.longitude,
    required this.latitude,
    required this.status,
    required this.reportDate,
    required this.email,
  });
}

class UpdateReport implements ReportEvent {
  final String id;
  final String refId;
  final String name;
  final String category;
  final double reportLong;
  final double reportLat;
  final String status;
  final String comment;
  final bool isVisible;
  final bool isDeleted;
  final List<String> imageUrls;
  final List<String> officerImageUrls;
  final List<Uint8List> officerImageFiles;

  UpdateReport({
    required this.id,
    required this.refId,
    required this.name,
    required this.category,
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
