// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_dump_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FullDumpDto extends FullDumpDto {
  @override
  final String refId;
  @override
  final String name;
  @override
  final String type;
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final bool isVisible;
  @override
  final String workingHours;
  @override
  final String moreInformation;
  @override
  final String? address;
  @override
  final String? phone;

  factory _$FullDumpDto([void Function(FullDumpDtoBuilder)? updates]) =>
      (new FullDumpDtoBuilder()..update(updates))._build();

  _$FullDumpDto._(
      {required this.refId,
      required this.name,
      required this.type,
      required this.longitude,
      required this.latitude,
      required this.isVisible,
      required this.workingHours,
      required this.moreInformation,
      this.address,
      this.phone})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(refId, r'FullDumpDto', 'refId');
    BuiltValueNullFieldError.checkNotNull(name, r'FullDumpDto', 'name');
    BuiltValueNullFieldError.checkNotNull(type, r'FullDumpDto', 'type');
    BuiltValueNullFieldError.checkNotNull(
        longitude, r'FullDumpDto', 'longitude');
    BuiltValueNullFieldError.checkNotNull(latitude, r'FullDumpDto', 'latitude');
    BuiltValueNullFieldError.checkNotNull(
        isVisible, r'FullDumpDto', 'isVisible');
    BuiltValueNullFieldError.checkNotNull(
        workingHours, r'FullDumpDto', 'workingHours');
    BuiltValueNullFieldError.checkNotNull(
        moreInformation, r'FullDumpDto', 'moreInformation');
  }

  @override
  FullDumpDto rebuild(void Function(FullDumpDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FullDumpDtoBuilder toBuilder() => new FullDumpDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FullDumpDto &&
        refId == other.refId &&
        name == other.name &&
        type == other.type &&
        longitude == other.longitude &&
        latitude == other.latitude &&
        isVisible == other.isVisible &&
        workingHours == other.workingHours &&
        moreInformation == other.moreInformation &&
        address == other.address &&
        phone == other.phone;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, refId.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, isVisible.hashCode);
    _$hash = $jc(_$hash, workingHours.hashCode);
    _$hash = $jc(_$hash, moreInformation.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FullDumpDto')
          ..add('refId', refId)
          ..add('name', name)
          ..add('type', type)
          ..add('longitude', longitude)
          ..add('latitude', latitude)
          ..add('isVisible', isVisible)
          ..add('workingHours', workingHours)
          ..add('moreInformation', moreInformation)
          ..add('address', address)
          ..add('phone', phone))
        .toString();
  }
}

class FullDumpDtoBuilder implements Builder<FullDumpDto, FullDumpDtoBuilder> {
  _$FullDumpDto? _$v;

  String? _refId;
  String? get refId => _$this._refId;
  set refId(String? refId) => _$this._refId = refId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  double? _longitude;
  double? get longitude => _$this._longitude;
  set longitude(double? longitude) => _$this._longitude = longitude;

  double? _latitude;
  double? get latitude => _$this._latitude;
  set latitude(double? latitude) => _$this._latitude = latitude;

  bool? _isVisible;
  bool? get isVisible => _$this._isVisible;
  set isVisible(bool? isVisible) => _$this._isVisible = isVisible;

  String? _workingHours;
  String? get workingHours => _$this._workingHours;
  set workingHours(String? workingHours) => _$this._workingHours = workingHours;

  String? _moreInformation;
  String? get moreInformation => _$this._moreInformation;
  set moreInformation(String? moreInformation) =>
      _$this._moreInformation = moreInformation;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  FullDumpDtoBuilder() {
    FullDumpDto._defaults(this);
  }

  FullDumpDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _refId = $v.refId;
      _name = $v.name;
      _type = $v.type;
      _longitude = $v.longitude;
      _latitude = $v.latitude;
      _isVisible = $v.isVisible;
      _workingHours = $v.workingHours;
      _moreInformation = $v.moreInformation;
      _address = $v.address;
      _phone = $v.phone;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FullDumpDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FullDumpDto;
  }

  @override
  void update(void Function(FullDumpDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FullDumpDto build() => _build();

  _$FullDumpDto _build() {
    final _$result = _$v ??
        new _$FullDumpDto._(
            refId: BuiltValueNullFieldError.checkNotNull(
                refId, r'FullDumpDto', 'refId'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'FullDumpDto', 'name'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'FullDumpDto', 'type'),
            longitude: BuiltValueNullFieldError.checkNotNull(
                longitude, r'FullDumpDto', 'longitude'),
            latitude: BuiltValueNullFieldError.checkNotNull(
                latitude, r'FullDumpDto', 'latitude'),
            isVisible: BuiltValueNullFieldError.checkNotNull(
                isVisible, r'FullDumpDto', 'isVisible'),
            workingHours: BuiltValueNullFieldError.checkNotNull(
                workingHours, r'FullDumpDto', 'workingHours'),
            moreInformation: BuiltValueNullFieldError.checkNotNull(
                moreInformation, r'FullDumpDto', 'moreInformation'),
            address: address,
            phone: phone);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
