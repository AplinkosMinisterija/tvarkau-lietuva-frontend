part of report_entity;

@JsonSerializable(createFactory: false)
class CreateReportRequest {
  final String name;
  final double reportLong;
  final double reportLat;
  final String reportDate;
  final String imageUrl;
  final String status;

  CreateReportRequest({
    required this.name,
    required this.reportLong,
    required this.reportLat,
    required this.reportDate,
    required this.imageUrl,
    required this.status,
  });

  @override
  Map<String, dynamic> toJson() => _$CreateReportRequestToJson(this);
}
