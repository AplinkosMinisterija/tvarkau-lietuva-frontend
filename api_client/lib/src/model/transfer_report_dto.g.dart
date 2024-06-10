// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_report_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TransferReportDto extends TransferReportDto {
  @override
  final String refId;
  @override
  final String name;
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final String status;
  @override
  final DateTime reportDate;
  @override
  final String email;

  factory _$TransferReportDto(
          [void Function(TransferReportDtoBuilder)? updates]) =>
      (new TransferReportDtoBuilder()..update(updates))._build();

  _$TransferReportDto._(
      {required this.refId,
      required this.name,
      required this.longitude,
      required this.latitude,
      required this.status,
      required this.reportDate,
      required this.email})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(refId, r'TransferReportDto', 'refId');
    BuiltValueNullFieldError.checkNotNull(name, r'TransferReportDto', 'name');
    BuiltValueNullFieldError.checkNotNull(
        longitude, r'TransferReportDto', 'longitude');
    BuiltValueNullFieldError.checkNotNull(
        latitude, r'TransferReportDto', 'latitude');
    BuiltValueNullFieldError.checkNotNull(
        status, r'TransferReportDto', 'status');
    BuiltValueNullFieldError.checkNotNull(
        reportDate, r'TransferReportDto', 'reportDate');
    BuiltValueNullFieldError.checkNotNull(email, r'TransferReportDto', 'email');
  }

  @override
  TransferReportDto rebuild(void Function(TransferReportDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransferReportDtoBuilder toBuilder() =>
      new TransferReportDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransferReportDto &&
        refId == other.refId &&
        name == other.name &&
        longitude == other.longitude &&
        latitude == other.latitude &&
        status == other.status &&
        reportDate == other.reportDate &&
        email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, refId.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, reportDate.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TransferReportDto')
          ..add('refId', refId)
          ..add('name', name)
          ..add('longitude', longitude)
          ..add('latitude', latitude)
          ..add('status', status)
          ..add('reportDate', reportDate)
          ..add('email', email))
        .toString();
  }
}

class TransferReportDtoBuilder
    implements Builder<TransferReportDto, TransferReportDtoBuilder> {
  _$TransferReportDto? _$v;

  String? _refId;
  String? get refId => _$this._refId;
  set refId(String? refId) => _$this._refId = refId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _longitude;
  double? get longitude => _$this._longitude;
  set longitude(double? longitude) => _$this._longitude = longitude;

  double? _latitude;
  double? get latitude => _$this._latitude;
  set latitude(double? latitude) => _$this._latitude = latitude;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  DateTime? _reportDate;
  DateTime? get reportDate => _$this._reportDate;
  set reportDate(DateTime? reportDate) => _$this._reportDate = reportDate;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  TransferReportDtoBuilder() {
    TransferReportDto._defaults(this);
  }

  TransferReportDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _refId = $v.refId;
      _name = $v.name;
      _longitude = $v.longitude;
      _latitude = $v.latitude;
      _status = $v.status;
      _reportDate = $v.reportDate;
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransferReportDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransferReportDto;
  }

  @override
  void update(void Function(TransferReportDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransferReportDto build() => _build();

  _$TransferReportDto _build() {
    final _$result = _$v ??
        new _$TransferReportDto._(
            refId: BuiltValueNullFieldError.checkNotNull(
                refId, r'TransferReportDto', 'refId'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'TransferReportDto', 'name'),
            longitude: BuiltValueNullFieldError.checkNotNull(
                longitude, r'TransferReportDto', 'longitude'),
            latitude: BuiltValueNullFieldError.checkNotNull(
                latitude, r'TransferReportDto', 'latitude'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'TransferReportDto', 'status'),
            reportDate: BuiltValueNullFieldError.checkNotNull(
                reportDate, r'TransferReportDto', 'reportDate'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'TransferReportDto', 'email'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
