// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_coords_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$JsonCoordsDto extends JsonCoordsDto {
  @override
  final double minLat;
  @override
  final double maxLat;
  @override
  final double minLong;
  @override
  final double maxLong;

  factory _$JsonCoordsDto([void Function(JsonCoordsDtoBuilder)? updates]) =>
      (new JsonCoordsDtoBuilder()..update(updates))._build();

  _$JsonCoordsDto._(
      {required this.minLat,
      required this.maxLat,
      required this.minLong,
      required this.maxLong})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(minLat, r'JsonCoordsDto', 'minLat');
    BuiltValueNullFieldError.checkNotNull(maxLat, r'JsonCoordsDto', 'maxLat');
    BuiltValueNullFieldError.checkNotNull(minLong, r'JsonCoordsDto', 'minLong');
    BuiltValueNullFieldError.checkNotNull(maxLong, r'JsonCoordsDto', 'maxLong');
  }

  @override
  JsonCoordsDto rebuild(void Function(JsonCoordsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  JsonCoordsDtoBuilder toBuilder() => new JsonCoordsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JsonCoordsDto &&
        minLat == other.minLat &&
        maxLat == other.maxLat &&
        minLong == other.minLong &&
        maxLong == other.maxLong;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, minLat.hashCode);
    _$hash = $jc(_$hash, maxLat.hashCode);
    _$hash = $jc(_$hash, minLong.hashCode);
    _$hash = $jc(_$hash, maxLong.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'JsonCoordsDto')
          ..add('minLat', minLat)
          ..add('maxLat', maxLat)
          ..add('minLong', minLong)
          ..add('maxLong', maxLong))
        .toString();
  }
}

class JsonCoordsDtoBuilder
    implements Builder<JsonCoordsDto, JsonCoordsDtoBuilder> {
  _$JsonCoordsDto? _$v;

  double? _minLat;
  double? get minLat => _$this._minLat;
  set minLat(double? minLat) => _$this._minLat = minLat;

  double? _maxLat;
  double? get maxLat => _$this._maxLat;
  set maxLat(double? maxLat) => _$this._maxLat = maxLat;

  double? _minLong;
  double? get minLong => _$this._minLong;
  set minLong(double? minLong) => _$this._minLong = minLong;

  double? _maxLong;
  double? get maxLong => _$this._maxLong;
  set maxLong(double? maxLong) => _$this._maxLong = maxLong;

  JsonCoordsDtoBuilder() {
    JsonCoordsDto._defaults(this);
  }

  JsonCoordsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _minLat = $v.minLat;
      _maxLat = $v.maxLat;
      _minLong = $v.minLong;
      _maxLong = $v.maxLong;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(JsonCoordsDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$JsonCoordsDto;
  }

  @override
  void update(void Function(JsonCoordsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  JsonCoordsDto build() => _build();

  _$JsonCoordsDto _build() {
    final _$result = _$v ??
        new _$JsonCoordsDto._(
            minLat: BuiltValueNullFieldError.checkNotNull(
                minLat, r'JsonCoordsDto', 'minLat'),
            maxLat: BuiltValueNullFieldError.checkNotNull(
                maxLat, r'JsonCoordsDto', 'maxLat'),
            minLong: BuiltValueNullFieldError.checkNotNull(
                minLong, r'JsonCoordsDto', 'minLong'),
            maxLong: BuiltValueNullFieldError.checkNotNull(
                maxLong, r'JsonCoordsDto', 'maxLong'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
