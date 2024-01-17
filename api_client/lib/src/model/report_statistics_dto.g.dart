// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_statistics_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReportStatisticsDto extends ReportStatisticsDto {
  @override
  final num totalSentReports;
  @override
  final num totalInInvestigationReports;
  @override
  final num totalInvestigatedReports;
  @override
  final num totalCleanedReports;
  @override
  final num totalFalseReports;

  factory _$ReportStatisticsDto(
          [void Function(ReportStatisticsDtoBuilder)? updates]) =>
      (new ReportStatisticsDtoBuilder()..update(updates))._build();

  _$ReportStatisticsDto._(
      {required this.totalSentReports,
      required this.totalInInvestigationReports,
      required this.totalInvestigatedReports,
      required this.totalCleanedReports,
      required this.totalFalseReports})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        totalSentReports, r'ReportStatisticsDto', 'totalSentReports');
    BuiltValueNullFieldError.checkNotNull(totalInInvestigationReports,
        r'ReportStatisticsDto', 'totalInInvestigationReports');
    BuiltValueNullFieldError.checkNotNull(totalInvestigatedReports,
        r'ReportStatisticsDto', 'totalInvestigatedReports');
    BuiltValueNullFieldError.checkNotNull(
        totalCleanedReports, r'ReportStatisticsDto', 'totalCleanedReports');
    BuiltValueNullFieldError.checkNotNull(
        totalFalseReports, r'ReportStatisticsDto', 'totalFalseReports');
  }

  @override
  ReportStatisticsDto rebuild(
          void Function(ReportStatisticsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportStatisticsDtoBuilder toBuilder() =>
      new ReportStatisticsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportStatisticsDto &&
        totalSentReports == other.totalSentReports &&
        totalInInvestigationReports == other.totalInInvestigationReports &&
        totalInvestigatedReports == other.totalInvestigatedReports &&
        totalCleanedReports == other.totalCleanedReports &&
        totalFalseReports == other.totalFalseReports;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, totalSentReports.hashCode);
    _$hash = $jc(_$hash, totalInInvestigationReports.hashCode);
    _$hash = $jc(_$hash, totalInvestigatedReports.hashCode);
    _$hash = $jc(_$hash, totalCleanedReports.hashCode);
    _$hash = $jc(_$hash, totalFalseReports.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReportStatisticsDto')
          ..add('totalSentReports', totalSentReports)
          ..add('totalInInvestigationReports', totalInInvestigationReports)
          ..add('totalInvestigatedReports', totalInvestigatedReports)
          ..add('totalCleanedReports', totalCleanedReports)
          ..add('totalFalseReports', totalFalseReports))
        .toString();
  }
}

class ReportStatisticsDtoBuilder
    implements Builder<ReportStatisticsDto, ReportStatisticsDtoBuilder> {
  _$ReportStatisticsDto? _$v;

  num? _totalSentReports;
  num? get totalSentReports => _$this._totalSentReports;
  set totalSentReports(num? totalSentReports) =>
      _$this._totalSentReports = totalSentReports;

  num? _totalInInvestigationReports;
  num? get totalInInvestigationReports => _$this._totalInInvestigationReports;
  set totalInInvestigationReports(num? totalInInvestigationReports) =>
      _$this._totalInInvestigationReports = totalInInvestigationReports;

  num? _totalInvestigatedReports;
  num? get totalInvestigatedReports => _$this._totalInvestigatedReports;
  set totalInvestigatedReports(num? totalInvestigatedReports) =>
      _$this._totalInvestigatedReports = totalInvestigatedReports;

  num? _totalCleanedReports;
  num? get totalCleanedReports => _$this._totalCleanedReports;
  set totalCleanedReports(num? totalCleanedReports) =>
      _$this._totalCleanedReports = totalCleanedReports;

  num? _totalFalseReports;
  num? get totalFalseReports => _$this._totalFalseReports;
  set totalFalseReports(num? totalFalseReports) =>
      _$this._totalFalseReports = totalFalseReports;

  ReportStatisticsDtoBuilder() {
    ReportStatisticsDto._defaults(this);
  }

  ReportStatisticsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _totalSentReports = $v.totalSentReports;
      _totalInInvestigationReports = $v.totalInInvestigationReports;
      _totalInvestigatedReports = $v.totalInvestigatedReports;
      _totalCleanedReports = $v.totalCleanedReports;
      _totalFalseReports = $v.totalFalseReports;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReportStatisticsDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReportStatisticsDto;
  }

  @override
  void update(void Function(ReportStatisticsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReportStatisticsDto build() => _build();

  _$ReportStatisticsDto _build() {
    final _$result = _$v ??
        new _$ReportStatisticsDto._(
            totalSentReports: BuiltValueNullFieldError.checkNotNull(
                totalSentReports, r'ReportStatisticsDto', 'totalSentReports'),
            totalInInvestigationReports: BuiltValueNullFieldError.checkNotNull(
                totalInInvestigationReports,
                r'ReportStatisticsDto',
                'totalInInvestigationReports'),
            totalInvestigatedReports: BuiltValueNullFieldError.checkNotNull(
                totalInvestigatedReports,
                r'ReportStatisticsDto',
                'totalInvestigatedReports'),
            totalCleanedReports: BuiltValueNullFieldError.checkNotNull(
                totalCleanedReports,
                r'ReportStatisticsDto',
                'totalCleanedReports'),
            totalFalseReports: BuiltValueNullFieldError.checkNotNull(
                totalFalseReports,
                r'ReportStatisticsDto',
                'totalFalseReports'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
