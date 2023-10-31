part of report_entity;

@JsonSerializable()
class HistoryEntity extends JsonSerializable {
  @JsonKey(defaultValue: '')
  final String? user;
  @JsonKey(defaultValue: '')
  final String? date;
  @JsonKey(defaultValue: [])
  final List<EditEntity>? edits;

  const HistoryEntity({this.user, this.date, this.edits});

  factory HistoryEntity.fromJson(Map<String, dynamic> json) {
    return _$HistoryEntityFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$HistoryEntityToJson(this);
}
