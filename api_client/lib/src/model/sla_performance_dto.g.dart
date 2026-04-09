// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sla_performance_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SlaPerformanceDto extends SlaPerformanceDto {
  @override
  final num within24h;
  @override
  final num within72h;
  @override
  final num within7d;
  @override
  final num within30d;
  @override
  final num over30d;
  @override
  final num within24hPercent;
  @override
  final num within72hPercent;
  @override
  final num within7dPercent;
  @override
  final num within30dPercent;

  factory _$SlaPerformanceDto(
          [void Function(SlaPerformanceDtoBuilder)? updates]) =>
      (new SlaPerformanceDtoBuilder()..update(updates))._build();

  _$SlaPerformanceDto._(
      {required this.within24h,
      required this.within72h,
      required this.within7d,
      required this.within30d,
      required this.over30d,
      required this.within24hPercent,
      required this.within72hPercent,
      required this.within7dPercent,
      required this.within30dPercent})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        within24h, r'SlaPerformanceDto', 'within24h');
    BuiltValueNullFieldError.checkNotNull(
        within72h, r'SlaPerformanceDto', 'within72h');
    BuiltValueNullFieldError.checkNotNull(
        within7d, r'SlaPerformanceDto', 'within7d');
    BuiltValueNullFieldError.checkNotNull(
        within30d, r'SlaPerformanceDto', 'within30d');
    BuiltValueNullFieldError.checkNotNull(
        over30d, r'SlaPerformanceDto', 'over30d');
    BuiltValueNullFieldError.checkNotNull(
        within24hPercent, r'SlaPerformanceDto', 'within24hPercent');
    BuiltValueNullFieldError.checkNotNull(
        within72hPercent, r'SlaPerformanceDto', 'within72hPercent');
    BuiltValueNullFieldError.checkNotNull(
        within7dPercent, r'SlaPerformanceDto', 'within7dPercent');
    BuiltValueNullFieldError.checkNotNull(
        within30dPercent, r'SlaPerformanceDto', 'within30dPercent');
  }

  @override
  SlaPerformanceDto rebuild(void Function(SlaPerformanceDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SlaPerformanceDtoBuilder toBuilder() =>
      new SlaPerformanceDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SlaPerformanceDto &&
        within24h == other.within24h &&
        within72h == other.within72h &&
        within7d == other.within7d &&
        within30d == other.within30d &&
        over30d == other.over30d &&
        within24hPercent == other.within24hPercent &&
        within72hPercent == other.within72hPercent &&
        within7dPercent == other.within7dPercent &&
        within30dPercent == other.within30dPercent;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, within24h.hashCode);
    _$hash = $jc(_$hash, within72h.hashCode);
    _$hash = $jc(_$hash, within7d.hashCode);
    _$hash = $jc(_$hash, within30d.hashCode);
    _$hash = $jc(_$hash, over30d.hashCode);
    _$hash = $jc(_$hash, within24hPercent.hashCode);
    _$hash = $jc(_$hash, within72hPercent.hashCode);
    _$hash = $jc(_$hash, within7dPercent.hashCode);
    _$hash = $jc(_$hash, within30dPercent.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SlaPerformanceDto')
          ..add('within24h', within24h)
          ..add('within72h', within72h)
          ..add('within7d', within7d)
          ..add('within30d', within30d)
          ..add('over30d', over30d)
          ..add('within24hPercent', within24hPercent)
          ..add('within72hPercent', within72hPercent)
          ..add('within7dPercent', within7dPercent)
          ..add('within30dPercent', within30dPercent))
        .toString();
  }
}

class SlaPerformanceDtoBuilder
    implements Builder<SlaPerformanceDto, SlaPerformanceDtoBuilder> {
  _$SlaPerformanceDto? _$v;

  num? _within24h;
  num? get within24h => _$this._within24h;
  set within24h(num? within24h) => _$this._within24h = within24h;

  num? _within72h;
  num? get within72h => _$this._within72h;
  set within72h(num? within72h) => _$this._within72h = within72h;

  num? _within7d;
  num? get within7d => _$this._within7d;
  set within7d(num? within7d) => _$this._within7d = within7d;

  num? _within30d;
  num? get within30d => _$this._within30d;
  set within30d(num? within30d) => _$this._within30d = within30d;

  num? _over30d;
  num? get over30d => _$this._over30d;
  set over30d(num? over30d) => _$this._over30d = over30d;

  num? _within24hPercent;
  num? get within24hPercent => _$this._within24hPercent;
  set within24hPercent(num? within24hPercent) =>
      _$this._within24hPercent = within24hPercent;

  num? _within72hPercent;
  num? get within72hPercent => _$this._within72hPercent;
  set within72hPercent(num? within72hPercent) =>
      _$this._within72hPercent = within72hPercent;

  num? _within7dPercent;
  num? get within7dPercent => _$this._within7dPercent;
  set within7dPercent(num? within7dPercent) =>
      _$this._within7dPercent = within7dPercent;

  num? _within30dPercent;
  num? get within30dPercent => _$this._within30dPercent;
  set within30dPercent(num? within30dPercent) =>
      _$this._within30dPercent = within30dPercent;

  SlaPerformanceDtoBuilder() {
    SlaPerformanceDto._defaults(this);
  }

  SlaPerformanceDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _within24h = $v.within24h;
      _within72h = $v.within72h;
      _within7d = $v.within7d;
      _within30d = $v.within30d;
      _over30d = $v.over30d;
      _within24hPercent = $v.within24hPercent;
      _within72hPercent = $v.within72hPercent;
      _within7dPercent = $v.within7dPercent;
      _within30dPercent = $v.within30dPercent;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SlaPerformanceDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SlaPerformanceDto;
  }

  @override
  void update(void Function(SlaPerformanceDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SlaPerformanceDto build() => _build();

  _$SlaPerformanceDto _build() {
    final _$result = _$v ??
        new _$SlaPerformanceDto._(
            within24h: BuiltValueNullFieldError.checkNotNull(
                within24h, r'SlaPerformanceDto', 'within24h'),
            within72h: BuiltValueNullFieldError.checkNotNull(
                within72h, r'SlaPerformanceDto', 'within72h'),
            within7d: BuiltValueNullFieldError.checkNotNull(
                within7d, r'SlaPerformanceDto', 'within7d'),
            within30d: BuiltValueNullFieldError.checkNotNull(
                within30d, r'SlaPerformanceDto', 'within30d'),
            over30d: BuiltValueNullFieldError.checkNotNull(
                over30d, r'SlaPerformanceDto', 'over30d'),
            within24hPercent: BuiltValueNullFieldError.checkNotNull(
                within24hPercent, r'SlaPerformanceDto', 'within24hPercent'),
            within72hPercent: BuiltValueNullFieldError.checkNotNull(
                within72hPercent, r'SlaPerformanceDto', 'within72hPercent'),
            within7dPercent: BuiltValueNullFieldError.checkNotNull(
                within7dPercent, r'SlaPerformanceDto', 'within7dPercent'),
            within30dPercent: BuiltValueNullFieldError.checkNotNull(
                within30dPercent, r'SlaPerformanceDto', 'within30dPercent'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
