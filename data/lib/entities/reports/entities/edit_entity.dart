part of report_entity;

@JsonSerializable()
class EditEntity extends JsonSerializable {
  @JsonKey(defaultValue: '')
  final String? field;
  @JsonKey(defaultValue: '')
  final String? change;

  const EditEntity({
    required this.field,
    required this.change,
  });


  factory EditEntity.fromJson(Map<String, dynamic> json) {
    return _$EditEntityFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$EditEntityToJson(this);
}

