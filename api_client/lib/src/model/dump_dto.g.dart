// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dump_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DumpDto extends DumpDto {
  @override
  final String name;
  @override
  final String type;
  @override
  final num reportLong;
  @override
  final num reportLat;
  @override
  final String? address;
  @override
  final String? phone;
  @override
  final String workingHours;
  @override
  final String moreInformation;

  factory _$DumpDto([void Function(DumpDtoBuilder)? updates]) =>
      (new DumpDtoBuilder()..update(updates))._build();

  _$DumpDto._(
      {required this.name,
      required this.type,
      required this.reportLong,
      required this.reportLat,
      this.address,
      this.phone,
      required this.workingHours,
      required this.moreInformation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'DumpDto', 'name');
    BuiltValueNullFieldError.checkNotNull(type, r'DumpDto', 'type');
    BuiltValueNullFieldError.checkNotNull(reportLong, r'DumpDto', 'reportLong');
    BuiltValueNullFieldError.checkNotNull(reportLat, r'DumpDto', 'reportLat');
    BuiltValueNullFieldError.checkNotNull(
        workingHours, r'DumpDto', 'workingHours');
    BuiltValueNullFieldError.checkNotNull(
        moreInformation, r'DumpDto', 'moreInformation');
  }

  @override
  DumpDto rebuild(void Function(DumpDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DumpDtoBuilder toBuilder() => new DumpDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DumpDto &&
        name == other.name &&
        type == other.type &&
        reportLong == other.reportLong &&
        reportLat == other.reportLat &&
        address == other.address &&
        phone == other.phone &&
        workingHours == other.workingHours &&
        moreInformation == other.moreInformation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, reportLong.hashCode);
    _$hash = $jc(_$hash, reportLat.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, workingHours.hashCode);
    _$hash = $jc(_$hash, moreInformation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DumpDto')
          ..add('name', name)
          ..add('type', type)
          ..add('reportLong', reportLong)
          ..add('reportLat', reportLat)
          ..add('address', address)
          ..add('phone', phone)
          ..add('workingHours', workingHours)
          ..add('moreInformation', moreInformation))
        .toString();
  }
}

class DumpDtoBuilder implements Builder<DumpDto, DumpDtoBuilder> {
  _$DumpDto? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  num? _reportLong;
  num? get reportLong => _$this._reportLong;
  set reportLong(num? reportLong) => _$this._reportLong = reportLong;

  num? _reportLat;
  num? get reportLat => _$this._reportLat;
  set reportLat(num? reportLat) => _$this._reportLat = reportLat;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _workingHours;
  String? get workingHours => _$this._workingHours;
  set workingHours(String? workingHours) => _$this._workingHours = workingHours;

  String? _moreInformation;
  String? get moreInformation => _$this._moreInformation;
  set moreInformation(String? moreInformation) =>
      _$this._moreInformation = moreInformation;

  DumpDtoBuilder() {
    DumpDto._defaults(this);
  }

  DumpDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _type = $v.type;
      _reportLong = $v.reportLong;
      _reportLat = $v.reportLat;
      _address = $v.address;
      _phone = $v.phone;
      _workingHours = $v.workingHours;
      _moreInformation = $v.moreInformation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DumpDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DumpDto;
  }

  @override
  void update(void Function(DumpDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DumpDto build() => _build();

  _$DumpDto _build() {
    final _$result = _$v ??
        new _$DumpDto._(
            name:
                BuiltValueNullFieldError.checkNotNull(name, r'DumpDto', 'name'),
            type:
                BuiltValueNullFieldError.checkNotNull(type, r'DumpDto', 'type'),
            reportLong: BuiltValueNullFieldError.checkNotNull(
                reportLong, r'DumpDto', 'reportLong'),
            reportLat: BuiltValueNullFieldError.checkNotNull(
                reportLat, r'DumpDto', 'reportLat'),
            address: address,
            phone: phone,
            workingHours: BuiltValueNullFieldError.checkNotNull(
                workingHours, r'DumpDto', 'workingHours'),
            moreInformation: BuiltValueNullFieldError.checkNotNull(
                moreInformation, r'DumpDto', 'moreInformation'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
