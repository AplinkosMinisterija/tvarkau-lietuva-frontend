// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_records_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StatusRecordsDto extends StatusRecordsDto {
  @override
  final String status;
  @override
  final DateTime date;

  factory _$StatusRecordsDto(
          [void Function(StatusRecordsDtoBuilder)? updates]) =>
      (new StatusRecordsDtoBuilder()..update(updates))._build();

  _$StatusRecordsDto._({required this.status, required this.date}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        status, r'StatusRecordsDto', 'status');
    BuiltValueNullFieldError.checkNotNull(date, r'StatusRecordsDto', 'date');
  }

  @override
  StatusRecordsDto rebuild(void Function(StatusRecordsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StatusRecordsDtoBuilder toBuilder() =>
      new StatusRecordsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StatusRecordsDto &&
        status == other.status &&
        date == other.date;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StatusRecordsDto')
          ..add('status', status)
          ..add('date', date))
        .toString();
  }
}

class StatusRecordsDtoBuilder
    implements Builder<StatusRecordsDto, StatusRecordsDtoBuilder> {
  _$StatusRecordsDto? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  StatusRecordsDtoBuilder() {
    StatusRecordsDto._defaults(this);
  }

  StatusRecordsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _date = $v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StatusRecordsDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StatusRecordsDto;
  }

  @override
  void update(void Function(StatusRecordsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StatusRecordsDto build() => _build();

  _$StatusRecordsDto _build() {
    final _$result = _$v ??
        new _$StatusRecordsDto._(
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'StatusRecordsDto', 'status'),
            date: BuiltValueNullFieldError.checkNotNull(
                date, r'StatusRecordsDto', 'date'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
