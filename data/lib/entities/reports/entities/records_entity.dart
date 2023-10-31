part of report_entity;

@JsonSerializable()
class RecordsEntity extends JsonSerializable {
  @JsonKey(defaultValue: '')
  final String? status;
  @JsonKey(defaultValue: '')
  final String? date;

  const RecordsEntity({
     this.status,
     this.date,
  });


  factory RecordsEntity.fromJson(Map<String, dynamic> json) {
    return _$RecordsEntityFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$RecordsEntityToJson(this);
}

