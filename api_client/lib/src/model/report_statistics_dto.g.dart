// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_statistics_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReportStatisticsDto extends ReportStatisticsDto {
  @override
  final int totalSentReports;
  @override
  final int totalInInvestigationReports;
  @override
  final int totalInvestigatedReports;
  @override
  final int totalFalseReports;

  factory _$ReportStatisticsDto(
          [void Function(ReportStatisticsDtoBuilder)? updates]) =>
      (new ReportStatisticsDtoBuilder()..update(updates))._build();

  _$ReportStatisticsDto._(
      {required this.totalSentReports,
      required this.totalInInvestigationReports,
      required this.totalInvestigatedReports,
      required this.totalFalseReports})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        totalSentReports, r'ReportStatisticsDto', 'totalSentReports');
    BuiltValueNullFieldError.checkNotNull(totalInInvestigationReports,
        r'ReportStatisticsDto', 'totalInInvestigationReports');
    BuiltValueNullFieldError.checkNotNull(totalInvestigatedReports,
        r'ReportStatisticsDto', 'totalInvestigatedReports');
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
        totalFalseReports == other.totalFalseReports;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, totalSentReports.hashCode);
    _$hash = $jc(_$hash, totalInInvestigationReports.hashCode);
    _$hash = $jc(_$hash, totalInvestigatedReports.hashCode);
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
          ..add('totalFalseReports', totalFalseReports))
        .toString();
  }
}

class ReportStatisticsDtoBuilder
    implements Builder<ReportStatisticsDto, ReportStatisticsDtoBuilder> {
  _$ReportStatisticsDto? _$v;

  int? _totalSentReports;
  int? get totalSentReports => _$this._totalSentReports;
  set totalSentReports(int? totalSentReports) =>
      _$this._totalSentReports = totalSentReports;

  int? _totalInInvestigationReports;
  int? get totalInInvestigationReports => _$this._totalInInvestigationReports;
  set totalInInvestigationReports(int? totalInInvestigationReports) =>
      _$this._totalInInvestigationReports = totalInInvestigationReports;

  int? _totalInvestigatedReports;
  int? get totalInvestigatedReports => _$this._totalInvestigatedReports;
  set totalInvestigatedReports(int? totalInvestigatedReports) =>
      _$this._totalInvestigatedReports = totalInvestigatedReports;

  int? _totalFalseReports;
  int? get totalFalseReports => _$this._totalFalseReports;
  set totalFalseReports(int? totalFalseReports) =>
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
            totalFalseReports: BuiltValueNullFieldError.checkNotNull(
                totalFalseReports,
                r'ReportStatisticsDto',
                'totalFalseReports'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
