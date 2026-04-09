// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_trend_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MonthlyTrendItemDto extends MonthlyTrendItemDto {
  @override
  final String period;
  @override
  final num year;
  @override
  final num month;
  @override
  final num count;
  @override
  final num resolved;
  @override
  final num avgResolutionHours;
  @override
  final num? countChangePercent;
  @override
  final num? resolvedChangePercent;
  @override
  final num? resolutionTimeChangePercent;

  factory _$MonthlyTrendItemDto(
          [void Function(MonthlyTrendItemDtoBuilder)? updates]) =>
      (new MonthlyTrendItemDtoBuilder()..update(updates))._build();

  _$MonthlyTrendItemDto._(
      {required this.period,
      required this.year,
      required this.month,
      required this.count,
      required this.resolved,
      required this.avgResolutionHours,
      this.countChangePercent,
      this.resolvedChangePercent,
      this.resolutionTimeChangePercent})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        period, r'MonthlyTrendItemDto', 'period');
    BuiltValueNullFieldError.checkNotNull(year, r'MonthlyTrendItemDto', 'year');
    BuiltValueNullFieldError.checkNotNull(
        month, r'MonthlyTrendItemDto', 'month');
    BuiltValueNullFieldError.checkNotNull(
        count, r'MonthlyTrendItemDto', 'count');
    BuiltValueNullFieldError.checkNotNull(
        resolved, r'MonthlyTrendItemDto', 'resolved');
    BuiltValueNullFieldError.checkNotNull(
        avgResolutionHours, r'MonthlyTrendItemDto', 'avgResolutionHours');
  }

  @override
  MonthlyTrendItemDto rebuild(
          void Function(MonthlyTrendItemDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MonthlyTrendItemDtoBuilder toBuilder() =>
      new MonthlyTrendItemDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MonthlyTrendItemDto &&
        period == other.period &&
        year == other.year &&
        month == other.month &&
        count == other.count &&
        resolved == other.resolved &&
        avgResolutionHours == other.avgResolutionHours &&
        countChangePercent == other.countChangePercent &&
        resolvedChangePercent == other.resolvedChangePercent &&
        resolutionTimeChangePercent == other.resolutionTimeChangePercent;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, period.hashCode);
    _$hash = $jc(_$hash, year.hashCode);
    _$hash = $jc(_$hash, month.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jc(_$hash, resolved.hashCode);
    _$hash = $jc(_$hash, avgResolutionHours.hashCode);
    _$hash = $jc(_$hash, countChangePercent.hashCode);
    _$hash = $jc(_$hash, resolvedChangePercent.hashCode);
    _$hash = $jc(_$hash, resolutionTimeChangePercent.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MonthlyTrendItemDto')
          ..add('period', period)
          ..add('year', year)
          ..add('month', month)
          ..add('count', count)
          ..add('resolved', resolved)
          ..add('avgResolutionHours', avgResolutionHours)
          ..add('countChangePercent', countChangePercent)
          ..add('resolvedChangePercent', resolvedChangePercent)
          ..add('resolutionTimeChangePercent', resolutionTimeChangePercent))
        .toString();
  }
}

class MonthlyTrendItemDtoBuilder
    implements Builder<MonthlyTrendItemDto, MonthlyTrendItemDtoBuilder> {
  _$MonthlyTrendItemDto? _$v;

  String? _period;
  String? get period => _$this._period;
  set period(String? period) => _$this._period = period;

  num? _year;
  num? get year => _$this._year;
  set year(num? year) => _$this._year = year;

  num? _month;
  num? get month => _$this._month;
  set month(num? month) => _$this._month = month;

  num? _count;
  num? get count => _$this._count;
  set count(num? count) => _$this._count = count;

  num? _resolved;
  num? get resolved => _$this._resolved;
  set resolved(num? resolved) => _$this._resolved = resolved;

  num? _avgResolutionHours;
  num? get avgResolutionHours => _$this._avgResolutionHours;
  set avgResolutionHours(num? avgResolutionHours) =>
      _$this._avgResolutionHours = avgResolutionHours;

  num? _countChangePercent;
  num? get countChangePercent => _$this._countChangePercent;
  set countChangePercent(num? countChangePercent) =>
      _$this._countChangePercent = countChangePercent;

  num? _resolvedChangePercent;
  num? get resolvedChangePercent => _$this._resolvedChangePercent;
  set resolvedChangePercent(num? resolvedChangePercent) =>
      _$this._resolvedChangePercent = resolvedChangePercent;

  num? _resolutionTimeChangePercent;
  num? get resolutionTimeChangePercent => _$this._resolutionTimeChangePercent;
  set resolutionTimeChangePercent(num? resolutionTimeChangePercent) =>
      _$this._resolutionTimeChangePercent = resolutionTimeChangePercent;

  MonthlyTrendItemDtoBuilder() {
    MonthlyTrendItemDto._defaults(this);
  }

  MonthlyTrendItemDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _period = $v.period;
      _year = $v.year;
      _month = $v.month;
      _count = $v.count;
      _resolved = $v.resolved;
      _avgResolutionHours = $v.avgResolutionHours;
      _countChangePercent = $v.countChangePercent;
      _resolvedChangePercent = $v.resolvedChangePercent;
      _resolutionTimeChangePercent = $v.resolutionTimeChangePercent;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MonthlyTrendItemDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MonthlyTrendItemDto;
  }

  @override
  void update(void Function(MonthlyTrendItemDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MonthlyTrendItemDto build() => _build();

  _$MonthlyTrendItemDto _build() {
    final _$result = _$v ??
        new _$MonthlyTrendItemDto._(
            period: BuiltValueNullFieldError.checkNotNull(
                period, r'MonthlyTrendItemDto', 'period'),
            year: BuiltValueNullFieldError.checkNotNull(
                year, r'MonthlyTrendItemDto', 'year'),
            month: BuiltValueNullFieldError.checkNotNull(
                month, r'MonthlyTrendItemDto', 'month'),
            count: BuiltValueNullFieldError.checkNotNull(
                count, r'MonthlyTrendItemDto', 'count'),
            resolved: BuiltValueNullFieldError.checkNotNull(
                resolved, r'MonthlyTrendItemDto', 'resolved'),
            avgResolutionHours: BuiltValueNullFieldError.checkNotNull(
                avgResolutionHours,
                r'MonthlyTrendItemDto',
                'avgResolutionHours'),
            countChangePercent: countChangePercent,
            resolvedChangePercent: resolvedChangePercent,
            resolutionTimeChangePercent: resolutionTimeChangePercent);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
