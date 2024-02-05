// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_dump_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateDumpDto extends CreateDumpDto {
  @override
  final String name;
  @override
  final num reportLong;
  @override
  final num reportLat;
  @override
  final String? address;
  @override
  final String? phone;
  @override
  final String? workingHours;
  @override
  final String? moreInformation;

  factory _$CreateDumpDto([void Function(CreateDumpDtoBuilder)? updates]) =>
      (new CreateDumpDtoBuilder()..update(updates))._build();

  _$CreateDumpDto._(
      {required this.name,
      required this.reportLong,
      required this.reportLat,
      this.address,
      this.phone,
      this.workingHours,
      this.moreInformation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'CreateDumpDto', 'name');
    BuiltValueNullFieldError.checkNotNull(
        reportLong, r'CreateDumpDto', 'reportLong');
    BuiltValueNullFieldError.checkNotNull(
        reportLat, r'CreateDumpDto', 'reportLat');
  }

  @override
  CreateDumpDto rebuild(void Function(CreateDumpDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateDumpDtoBuilder toBuilder() => new CreateDumpDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateDumpDto &&
        name == other.name &&
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
    return (newBuiltValueToStringHelper(r'CreateDumpDto')
          ..add('name', name)
          ..add('reportLong', reportLong)
          ..add('reportLat', reportLat)
          ..add('address', address)
          ..add('phone', phone)
          ..add('workingHours', workingHours)
          ..add('moreInformation', moreInformation))
        .toString();
  }
}

class CreateDumpDtoBuilder
    implements Builder<CreateDumpDto, CreateDumpDtoBuilder> {
  _$CreateDumpDto? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

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

  CreateDumpDtoBuilder() {
    CreateDumpDto._defaults(this);
  }

  CreateDumpDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
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
  void replace(CreateDumpDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateDumpDto;
  }

  @override
  void update(void Function(CreateDumpDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateDumpDto build() => _build();

  _$CreateDumpDto _build() {
    final _$result = _$v ??
        new _$CreateDumpDto._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'CreateDumpDto', 'name'),
            reportLong: BuiltValueNullFieldError.checkNotNull(
                reportLong, r'CreateDumpDto', 'reportLong'),
            reportLat: BuiltValueNullFieldError.checkNotNull(
                reportLat, r'CreateDumpDto', 'reportLat'),
            address: address,
            phone: phone,
            workingHours: workingHours,
            moreInformation: moreInformation);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
