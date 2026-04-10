// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resolution_performance_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ResolutionPerformanceDto extends ResolutionPerformanceDto {
  @override
  final num avgResolutionHours;
  @override
  final num medianResolutionHours;
  @override
  final num minResolutionHours;
  @override
  final num maxResolutionHours;
  @override
  final SlaPerformanceDto sla;
  @override
  final num resolvedCount;

  factory _$ResolutionPerformanceDto(
          [void Function(ResolutionPerformanceDtoBuilder)? updates]) =>
      (new ResolutionPerformanceDtoBuilder()..update(updates))._build();

  _$ResolutionPerformanceDto._(
      {required this.avgResolutionHours,
      required this.medianResolutionHours,
      required this.minResolutionHours,
      required this.maxResolutionHours,
      required this.sla,
      required this.resolvedCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        avgResolutionHours, r'ResolutionPerformanceDto', 'avgResolutionHours');
    BuiltValueNullFieldError.checkNotNull(medianResolutionHours,
        r'ResolutionPerformanceDto', 'medianResolutionHours');
    BuiltValueNullFieldError.checkNotNull(
        minResolutionHours, r'ResolutionPerformanceDto', 'minResolutionHours');
    BuiltValueNullFieldError.checkNotNull(
        maxResolutionHours, r'ResolutionPerformanceDto', 'maxResolutionHours');
    BuiltValueNullFieldError.checkNotNull(
        sla, r'ResolutionPerformanceDto', 'sla');
    BuiltValueNullFieldError.checkNotNull(
        resolvedCount, r'ResolutionPerformanceDto', 'resolvedCount');
  }

  @override
  ResolutionPerformanceDto rebuild(
          void Function(ResolutionPerformanceDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResolutionPerformanceDtoBuilder toBuilder() =>
      new ResolutionPerformanceDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResolutionPerformanceDto &&
        avgResolutionHours == other.avgResolutionHours &&
        medianResolutionHours == other.medianResolutionHours &&
        minResolutionHours == other.minResolutionHours &&
        maxResolutionHours == other.maxResolutionHours &&
        sla == other.sla &&
        resolvedCount == other.resolvedCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, avgResolutionHours.hashCode);
    _$hash = $jc(_$hash, medianResolutionHours.hashCode);
    _$hash = $jc(_$hash, minResolutionHours.hashCode);
    _$hash = $jc(_$hash, maxResolutionHours.hashCode);
    _$hash = $jc(_$hash, sla.hashCode);
    _$hash = $jc(_$hash, resolvedCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResolutionPerformanceDto')
          ..add('avgResolutionHours', avgResolutionHours)
          ..add('medianResolutionHours', medianResolutionHours)
          ..add('minResolutionHours', minResolutionHours)
          ..add('maxResolutionHours', maxResolutionHours)
          ..add('sla', sla)
          ..add('resolvedCount', resolvedCount))
        .toString();
  }
}

class ResolutionPerformanceDtoBuilder
    implements
        Builder<ResolutionPerformanceDto, ResolutionPerformanceDtoBuilder> {
  _$ResolutionPerformanceDto? _$v;

  num? _avgResolutionHours;
  num? get avgResolutionHours => _$this._avgResolutionHours;
  set avgResolutionHours(num? avgResolutionHours) =>
      _$this._avgResolutionHours = avgResolutionHours;

  num? _medianResolutionHours;
  num? get medianResolutionHours => _$this._medianResolutionHours;
  set medianResolutionHours(num? medianResolutionHours) =>
      _$this._medianResolutionHours = medianResolutionHours;

  num? _minResolutionHours;
  num? get minResolutionHours => _$this._minResolutionHours;
  set minResolutionHours(num? minResolutionHours) =>
      _$this._minResolutionHours = minResolutionHours;

  num? _maxResolutionHours;
  num? get maxResolutionHours => _$this._maxResolutionHours;
  set maxResolutionHours(num? maxResolutionHours) =>
      _$this._maxResolutionHours = maxResolutionHours;

  SlaPerformanceDtoBuilder? _sla;
  SlaPerformanceDtoBuilder get sla =>
      _$this._sla ??= new SlaPerformanceDtoBuilder();
  set sla(SlaPerformanceDtoBuilder? sla) => _$this._sla = sla;

  num? _resolvedCount;
  num? get resolvedCount => _$this._resolvedCount;
  set resolvedCount(num? resolvedCount) =>
      _$this._resolvedCount = resolvedCount;

  ResolutionPerformanceDtoBuilder() {
    ResolutionPerformanceDto._defaults(this);
  }

  ResolutionPerformanceDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _avgResolutionHours = $v.avgResolutionHours;
      _medianResolutionHours = $v.medianResolutionHours;
      _minResolutionHours = $v.minResolutionHours;
      _maxResolutionHours = $v.maxResolutionHours;
      _sla = $v.sla.toBuilder();
      _resolvedCount = $v.resolvedCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResolutionPerformanceDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResolutionPerformanceDto;
  }

  @override
  void update(void Function(ResolutionPerformanceDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResolutionPerformanceDto build() => _build();

  _$ResolutionPerformanceDto _build() {
    _$ResolutionPerformanceDto _$result;
    try {
      _$result = _$v ??
          new _$ResolutionPerformanceDto._(
              avgResolutionHours: BuiltValueNullFieldError.checkNotNull(
                  avgResolutionHours,
                  r'ResolutionPerformanceDto',
                  'avgResolutionHours'),
              medianResolutionHours: BuiltValueNullFieldError.checkNotNull(
                  medianResolutionHours,
                  r'ResolutionPerformanceDto',
                  'medianResolutionHours'),
              minResolutionHours: BuiltValueNullFieldError.checkNotNull(
                  minResolutionHours,
                  r'ResolutionPerformanceDto',
                  'minResolutionHours'),
              maxResolutionHours: BuiltValueNullFieldError.checkNotNull(
                  maxResolutionHours,
                  r'ResolutionPerformanceDto',
                  'maxResolutionHours'),
              sla: sla.build(),
              resolvedCount: BuiltValueNullFieldError.checkNotNull(
                  resolvedCount, r'ResolutionPerformanceDto', 'resolvedCount'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sla';
        sla.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ResolutionPerformanceDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
