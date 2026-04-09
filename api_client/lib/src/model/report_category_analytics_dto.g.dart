// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_category_analytics_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReportCategoryAnalyticsDto extends ReportCategoryAnalyticsDto {
  @override
  final OverallSummaryDto summary;
  @override
  final BuiltList<StatusDistributionItemDto> statusDistribution;
  @override
  final BuiltList<CategoryBreakdownItemDto> categoryBreakdown;
  @override
  final BuiltList<RegionBreakdownItemDto> geographicBreakdown;
  @override
  final BuiltList<MonthlyTrendItemDto> monthlyTrends;
  @override
  final ResolutionPerformanceDto resolutionPerformance;
  @override
  final String generatedAt;

  factory _$ReportCategoryAnalyticsDto(
          [void Function(ReportCategoryAnalyticsDtoBuilder)? updates]) =>
      (new ReportCategoryAnalyticsDtoBuilder()..update(updates))._build();

  _$ReportCategoryAnalyticsDto._(
      {required this.summary,
      required this.statusDistribution,
      required this.categoryBreakdown,
      required this.geographicBreakdown,
      required this.monthlyTrends,
      required this.resolutionPerformance,
      required this.generatedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        summary, r'ReportCategoryAnalyticsDto', 'summary');
    BuiltValueNullFieldError.checkNotNull(statusDistribution,
        r'ReportCategoryAnalyticsDto', 'statusDistribution');
    BuiltValueNullFieldError.checkNotNull(
        categoryBreakdown, r'ReportCategoryAnalyticsDto', 'categoryBreakdown');
    BuiltValueNullFieldError.checkNotNull(geographicBreakdown,
        r'ReportCategoryAnalyticsDto', 'geographicBreakdown');
    BuiltValueNullFieldError.checkNotNull(
        monthlyTrends, r'ReportCategoryAnalyticsDto', 'monthlyTrends');
    BuiltValueNullFieldError.checkNotNull(resolutionPerformance,
        r'ReportCategoryAnalyticsDto', 'resolutionPerformance');
    BuiltValueNullFieldError.checkNotNull(
        generatedAt, r'ReportCategoryAnalyticsDto', 'generatedAt');
  }

  @override
  ReportCategoryAnalyticsDto rebuild(
          void Function(ReportCategoryAnalyticsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportCategoryAnalyticsDtoBuilder toBuilder() =>
      new ReportCategoryAnalyticsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportCategoryAnalyticsDto &&
        summary == other.summary &&
        statusDistribution == other.statusDistribution &&
        categoryBreakdown == other.categoryBreakdown &&
        geographicBreakdown == other.geographicBreakdown &&
        monthlyTrends == other.monthlyTrends &&
        resolutionPerformance == other.resolutionPerformance &&
        generatedAt == other.generatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, summary.hashCode);
    _$hash = $jc(_$hash, statusDistribution.hashCode);
    _$hash = $jc(_$hash, categoryBreakdown.hashCode);
    _$hash = $jc(_$hash, geographicBreakdown.hashCode);
    _$hash = $jc(_$hash, monthlyTrends.hashCode);
    _$hash = $jc(_$hash, resolutionPerformance.hashCode);
    _$hash = $jc(_$hash, generatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReportCategoryAnalyticsDto')
          ..add('summary', summary)
          ..add('statusDistribution', statusDistribution)
          ..add('categoryBreakdown', categoryBreakdown)
          ..add('geographicBreakdown', geographicBreakdown)
          ..add('monthlyTrends', monthlyTrends)
          ..add('resolutionPerformance', resolutionPerformance)
          ..add('generatedAt', generatedAt))
        .toString();
  }
}

class ReportCategoryAnalyticsDtoBuilder
    implements
        Builder<ReportCategoryAnalyticsDto, ReportCategoryAnalyticsDtoBuilder> {
  _$ReportCategoryAnalyticsDto? _$v;

  OverallSummaryDtoBuilder? _summary;
  OverallSummaryDtoBuilder get summary =>
      _$this._summary ??= new OverallSummaryDtoBuilder();
  set summary(OverallSummaryDtoBuilder? summary) => _$this._summary = summary;

  ListBuilder<StatusDistributionItemDto>? _statusDistribution;
  ListBuilder<StatusDistributionItemDto> get statusDistribution =>
      _$this._statusDistribution ??=
          new ListBuilder<StatusDistributionItemDto>();
  set statusDistribution(
          ListBuilder<StatusDistributionItemDto>? statusDistribution) =>
      _$this._statusDistribution = statusDistribution;

  ListBuilder<CategoryBreakdownItemDto>? _categoryBreakdown;
  ListBuilder<CategoryBreakdownItemDto> get categoryBreakdown =>
      _$this._categoryBreakdown ??= new ListBuilder<CategoryBreakdownItemDto>();
  set categoryBreakdown(
          ListBuilder<CategoryBreakdownItemDto>? categoryBreakdown) =>
      _$this._categoryBreakdown = categoryBreakdown;

  ListBuilder<RegionBreakdownItemDto>? _geographicBreakdown;
  ListBuilder<RegionBreakdownItemDto> get geographicBreakdown =>
      _$this._geographicBreakdown ??= new ListBuilder<RegionBreakdownItemDto>();
  set geographicBreakdown(
          ListBuilder<RegionBreakdownItemDto>? geographicBreakdown) =>
      _$this._geographicBreakdown = geographicBreakdown;

  ListBuilder<MonthlyTrendItemDto>? _monthlyTrends;
  ListBuilder<MonthlyTrendItemDto> get monthlyTrends =>
      _$this._monthlyTrends ??= new ListBuilder<MonthlyTrendItemDto>();
  set monthlyTrends(ListBuilder<MonthlyTrendItemDto>? monthlyTrends) =>
      _$this._monthlyTrends = monthlyTrends;

  ResolutionPerformanceDtoBuilder? _resolutionPerformance;
  ResolutionPerformanceDtoBuilder get resolutionPerformance =>
      _$this._resolutionPerformance ??= new ResolutionPerformanceDtoBuilder();
  set resolutionPerformance(
          ResolutionPerformanceDtoBuilder? resolutionPerformance) =>
      _$this._resolutionPerformance = resolutionPerformance;

  String? _generatedAt;
  String? get generatedAt => _$this._generatedAt;
  set generatedAt(String? generatedAt) => _$this._generatedAt = generatedAt;

  ReportCategoryAnalyticsDtoBuilder() {
    ReportCategoryAnalyticsDto._defaults(this);
  }

  ReportCategoryAnalyticsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _summary = $v.summary.toBuilder();
      _statusDistribution = $v.statusDistribution.toBuilder();
      _categoryBreakdown = $v.categoryBreakdown.toBuilder();
      _geographicBreakdown = $v.geographicBreakdown.toBuilder();
      _monthlyTrends = $v.monthlyTrends.toBuilder();
      _resolutionPerformance = $v.resolutionPerformance.toBuilder();
      _generatedAt = $v.generatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReportCategoryAnalyticsDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReportCategoryAnalyticsDto;
  }

  @override
  void update(void Function(ReportCategoryAnalyticsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReportCategoryAnalyticsDto build() => _build();

  _$ReportCategoryAnalyticsDto _build() {
    _$ReportCategoryAnalyticsDto _$result;
    try {
      _$result = _$v ??
          new _$ReportCategoryAnalyticsDto._(
              summary: summary.build(),
              statusDistribution: statusDistribution.build(),
              categoryBreakdown: categoryBreakdown.build(),
              geographicBreakdown: geographicBreakdown.build(),
              monthlyTrends: monthlyTrends.build(),
              resolutionPerformance: resolutionPerformance.build(),
              generatedAt: BuiltValueNullFieldError.checkNotNull(
                  generatedAt, r'ReportCategoryAnalyticsDto', 'generatedAt'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'summary';
        summary.build();
        _$failedField = 'statusDistribution';
        statusDistribution.build();
        _$failedField = 'categoryBreakdown';
        categoryBreakdown.build();
        _$failedField = 'geographicBreakdown';
        geographicBreakdown.build();
        _$failedField = 'monthlyTrends';
        monthlyTrends.build();
        _$failedField = 'resolutionPerformance';
        resolutionPerformance.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ReportCategoryAnalyticsDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
