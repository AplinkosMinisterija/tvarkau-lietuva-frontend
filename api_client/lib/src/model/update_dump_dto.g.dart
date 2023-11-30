// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_dump_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateDumpDto extends UpdateDumpDto {
  @override
  final String id;
  @override
  final String name;
  @override
  final num longitude;
  @override
  final num latitude;
  @override
  final bool isVisible;
  @override
  final String address;
  @override
  final String phone;
  @override
  final String workingHours;
  @override
  final String moreInformation;

  factory _$UpdateDumpDto([void Function(UpdateDumpDtoBuilder)? updates]) =>
      (new UpdateDumpDtoBuilder()..update(updates))._build();

  _$UpdateDumpDto._(
      {required this.id,
      required this.name,
      required this.longitude,
      required this.latitude,
      required this.isVisible,
      required this.address,
      required this.phone,
      required this.workingHours,
      required this.moreInformation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'UpdateDumpDto', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'UpdateDumpDto', 'name');
    BuiltValueNullFieldError.checkNotNull(
        longitude, r'UpdateDumpDto', 'longitude');
    BuiltValueNullFieldError.checkNotNull(
        latitude, r'UpdateDumpDto', 'latitude');
    BuiltValueNullFieldError.checkNotNull(
        isVisible, r'UpdateDumpDto', 'isVisible');
    BuiltValueNullFieldError.checkNotNull(address, r'UpdateDumpDto', 'address');
    BuiltValueNullFieldError.checkNotNull(phone, r'UpdateDumpDto', 'phone');
    BuiltValueNullFieldError.checkNotNull(
        workingHours, r'UpdateDumpDto', 'workingHours');
    BuiltValueNullFieldError.checkNotNull(
        moreInformation, r'UpdateDumpDto', 'moreInformation');
  }

  @override
  UpdateDumpDto rebuild(void Function(UpdateDumpDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateDumpDtoBuilder toBuilder() => new UpdateDumpDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateDumpDto &&
        id == other.id &&
        name == other.name &&
        longitude == other.longitude &&
        latitude == other.latitude &&
        isVisible == other.isVisible &&
        address == other.address &&
        phone == other.phone &&
        workingHours == other.workingHours &&
        moreInformation == other.moreInformation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, isVisible.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, workingHours.hashCode);
    _$hash = $jc(_$hash, moreInformation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateDumpDto')
          ..add('id', id)
          ..add('name', name)
          ..add('longitude', longitude)
          ..add('latitude', latitude)
          ..add('isVisible', isVisible)
          ..add('address', address)
          ..add('phone', phone)
          ..add('workingHours', workingHours)
          ..add('moreInformation', moreInformation))
        .toString();
  }
}

class UpdateDumpDtoBuilder
    implements Builder<UpdateDumpDto, UpdateDumpDtoBuilder> {
  _$UpdateDumpDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  num? _longitude;
  num? get longitude => _$this._longitude;
  set longitude(num? longitude) => _$this._longitude = longitude;

  num? _latitude;
  num? get latitude => _$this._latitude;
  set latitude(num? latitude) => _$this._latitude = latitude;

  bool? _isVisible;
  bool? get isVisible => _$this._isVisible;
  set isVisible(bool? isVisible) => _$this._isVisible = isVisible;

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

  UpdateDumpDtoBuilder() {
    UpdateDumpDto._defaults(this);
  }

  UpdateDumpDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _longitude = $v.longitude;
      _latitude = $v.latitude;
      _isVisible = $v.isVisible;
      _address = $v.address;
      _phone = $v.phone;
      _workingHours = $v.workingHours;
      _moreInformation = $v.moreInformation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateDumpDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateDumpDto;
  }

  @override
  void update(void Function(UpdateDumpDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateDumpDto build() => _build();

  _$UpdateDumpDto _build() {
    final _$result = _$v ??
        new _$UpdateDumpDto._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'UpdateDumpDto', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'UpdateDumpDto', 'name'),
            longitude: BuiltValueNullFieldError.checkNotNull(
                longitude, r'UpdateDumpDto', 'longitude'),
            latitude: BuiltValueNullFieldError.checkNotNull(
                latitude, r'UpdateDumpDto', 'latitude'),
            isVisible: BuiltValueNullFieldError.checkNotNull(
                isVisible, r'UpdateDumpDto', 'isVisible'),
            address: BuiltValueNullFieldError.checkNotNull(
                address, r'UpdateDumpDto', 'address'),
            phone: BuiltValueNullFieldError.checkNotNull(
                phone, r'UpdateDumpDto', 'phone'),
            workingHours: BuiltValueNullFieldError.checkNotNull(
                workingHours, r'UpdateDumpDto', 'workingHours'),
            moreInformation: BuiltValueNullFieldError.checkNotNull(
                moreInformation, r'UpdateDumpDto', 'moreInformation'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
