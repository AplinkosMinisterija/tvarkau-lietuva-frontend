part of report_entity;

@JsonSerializable()
class ReportEntity extends JsonSerializable {
  @JsonKey(name: '_id')
  final String id;
  final String? refId;
  final String name;
  final String type;
  final double reportLong;
  final double reportLat;
  final String status;
  @JsonKey(defaultValue: '')
  final String? phone;
  @JsonKey(defaultValue: '')
  final String? comment;
  @JsonKey(defaultValue: '-')
  final String? email;
  @JsonKey(defaultValue: '')
  final String? address;
  @JsonKey(defaultValue: '')
  final String? workingHours;
  @JsonKey(defaultValue: '')
  final String? moreInformation;
  @JsonKey(defaultValue: '')
  final String reportDate;
  @JsonKey(defaultValue: false)
  final bool isVisible;
  @JsonKey(defaultValue: false)
  final bool? isDeleted;
  @JsonKey(defaultValue: [])
  final List<String> imageUrls;
  @JsonKey(name: 'historyData')
  final List<HistoryEntity>? historyData;
  @JsonKey(name: 'statusRecords')
  final List<RecordsEntity>? statusRecords;

  const ReportEntity({
    required this.refId,
    required this.isDeleted,
    this.historyData,
    required this.id,
    required this.name,
    required this.type,
    required this.reportLong,
    required this.reportLat,
    required this.status,
    required this.isVisible,
    this.email,
    this.phone,
    this.address,
    this.comment,
    this.workingHours,
    this.moreInformation,
    required this.imageUrls,
    required this.reportDate,
    this.statusRecords,
  });

  factory ReportEntity.fromJson(Map<String, dynamic> json) {
    return _$ReportEntityFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$ReportEntityToJson(this);
}

class HistoryData {
  String? user;
  String? date;
  List<Edits>? edits;

  HistoryData({
    this.user,
    this.date,
    this.edits,
  });
}

class Edits {
  String? field;
  String? change;

  Edits({
    this.field,
    this.change,
  });
}

class StatusRecords {
  String? status;
  String? date;

  StatusRecords({
    this.status,
    this.date,
  });
}
