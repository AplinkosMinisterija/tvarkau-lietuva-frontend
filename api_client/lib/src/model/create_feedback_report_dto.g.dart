// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_feedback_report_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateFeedbackReportDto extends CreateFeedbackReportDto {
  @override
  final String description;
  @override
  final String email;

  factory _$CreateFeedbackReportDto(
          [void Function(CreateFeedbackReportDtoBuilder)? updates]) =>
      (new CreateFeedbackReportDtoBuilder()..update(updates))._build();

  _$CreateFeedbackReportDto._({required this.description, required this.email})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        description, r'CreateFeedbackReportDto', 'description');
    BuiltValueNullFieldError.checkNotNull(
        email, r'CreateFeedbackReportDto', 'email');
  }

  @override
  CreateFeedbackReportDto rebuild(
          void Function(CreateFeedbackReportDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateFeedbackReportDtoBuilder toBuilder() =>
      new CreateFeedbackReportDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateFeedbackReportDto &&
        description == other.description &&
        email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateFeedbackReportDto')
          ..add('description', description)
          ..add('email', email))
        .toString();
  }
}

class CreateFeedbackReportDtoBuilder
    implements
        Builder<CreateFeedbackReportDto, CreateFeedbackReportDtoBuilder> {
  _$CreateFeedbackReportDto? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  CreateFeedbackReportDtoBuilder() {
    CreateFeedbackReportDto._defaults(this);
  }

  CreateFeedbackReportDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateFeedbackReportDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateFeedbackReportDto;
  }

  @override
  void update(void Function(CreateFeedbackReportDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateFeedbackReportDto build() => _build();

  _$CreateFeedbackReportDto _build() {
    final _$result = _$v ??
        new _$CreateFeedbackReportDto._(
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'CreateFeedbackReportDto', 'description'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'CreateFeedbackReportDto', 'email'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
