// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_breakdown_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RegionBreakdownItemDto extends RegionBreakdownItemDto {
  @override
  final String region;
  @override
  final num count;
  @override
  final num percentage;
  @override
  final num avgResolutionHours;
  @override
  final BuiltList<StatusDistributionItemDto> statusDistribution;

  factory _$RegionBreakdownItemDto(
          [void Function(RegionBreakdownItemDtoBuilder)? updates]) =>
      (new RegionBreakdownItemDtoBuilder()..update(updates))._build();

  _$RegionBreakdownItemDto._(
      {required this.region,
      required this.count,
      required this.percentage,
      required this.avgResolutionHours,
      required this.statusDistribution})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        region, r'RegionBreakdownItemDto', 'region');
    BuiltValueNullFieldError.checkNotNull(
        count, r'RegionBreakdownItemDto', 'count');
    BuiltValueNullFieldError.checkNotNull(
        percentage, r'RegionBreakdownItemDto', 'percentage');
    BuiltValueNullFieldError.checkNotNull(
        avgResolutionHours, r'RegionBreakdownItemDto', 'avgResolutionHours');
    BuiltValueNullFieldError.checkNotNull(
        statusDistribution, r'RegionBreakdownItemDto', 'statusDistribution');
  }

  @override
  RegionBreakdownItemDto rebuild(
          void Function(RegionBreakdownItemDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegionBreakdownItemDtoBuilder toBuilder() =>
      new RegionBreakdownItemDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegionBreakdownItemDto &&
        region == other.region &&
        count == other.count &&
        percentage == other.percentage &&
        avgResolutionHours == other.avgResolutionHours &&
        statusDistribution == other.statusDistribution;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, region.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jc(_$hash, percentage.hashCode);
    _$hash = $jc(_$hash, avgResolutionHours.hashCode);
    _$hash = $jc(_$hash, statusDistribution.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegionBreakdownItemDto')
          ..add('region', region)
          ..add('count', count)
          ..add('percentage', percentage)
          ..add('avgResolutionHours', avgResolutionHours)
          ..add('statusDistribution', statusDistribution))
        .toString();
  }
}

class RegionBreakdownItemDtoBuilder
    implements Builder<RegionBreakdownItemDto, RegionBreakdownItemDtoBuilder> {
  _$RegionBreakdownItemDto? _$v;

  String? _region;
  String? get region => _$this._region;
  set region(String? region) => _$this._region = region;

  num? _count;
  num? get count => _$this._count;
  set count(num? count) => _$this._count = count;

  num? _percentage;
  num? get percentage => _$this._percentage;
  set percentage(num? percentage) => _$this._percentage = percentage;

  num? _avgResolutionHours;
  num? get avgResolutionHours => _$this._avgResolutionHours;
  set avgResolutionHours(num? avgResolutionHours) =>
      _$this._avgResolutionHours = avgResolutionHours;

  ListBuilder<StatusDistributionItemDto>? _statusDistribution;
  ListBuilder<StatusDistributionItemDto> get statusDistribution =>
      _$this._statusDistribution ??=
          new ListBuilder<StatusDistributionItemDto>();
  set statusDistribution(
          ListBuilder<StatusDistributionItemDto>? statusDistribution) =>
      _$this._statusDistribution = statusDistribution;

  RegionBreakdownItemDtoBuilder() {
    RegionBreakdownItemDto._defaults(this);
  }

  RegionBreakdownItemDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _region = $v.region;
      _count = $v.count;
      _percentage = $v.percentage;
      _avgResolutionHours = $v.avgResolutionHours;
      _statusDistribution = $v.statusDistribution.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegionBreakdownItemDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegionBreakdownItemDto;
  }

  @override
  void update(void Function(RegionBreakdownItemDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegionBreakdownItemDto build() => _build();

  _$RegionBreakdownItemDto _build() {
    _$RegionBreakdownItemDto _$result;
    try {
      _$result = _$v ??
          new _$RegionBreakdownItemDto._(
              region: BuiltValueNullFieldError.checkNotNull(
                  region, r'RegionBreakdownItemDto', 'region'),
              count: BuiltValueNullFieldError.checkNotNull(
                  count, r'RegionBreakdownItemDto', 'count'),
              percentage: BuiltValueNullFieldError.checkNotNull(
                  percentage, r'RegionBreakdownItemDto', 'percentage'),
              avgResolutionHours: BuiltValueNullFieldError.checkNotNull(
                  avgResolutionHours,
                  r'RegionBreakdownItemDto',
                  'avgResolutionHours'),
              statusDistribution: statusDistribution.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'statusDistribution';
        statusDistribution.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'RegionBreakdownItemDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
