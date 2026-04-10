// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overall_summary_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OverallSummaryDto extends OverallSummaryDto {
  @override
  final num totalReports;
  @override
  final num resolvedReports;
  @override
  final num inInvestigationReports;
  @override
  final num receivedReports;
  @override
  final num falseReports;
  @override
  final num resolutionRate;
  @override
  final num avgResolutionHours;
  @override
  final num reportsPer30Days;
  @override
  final num reportsLast7Days;
  @override
  final num reportsLast30Days;
  @override
  final num reportsLast90Days;
  @override
  final num? last30DaysChangePercent;

  factory _$OverallSummaryDto(
          [void Function(OverallSummaryDtoBuilder)? updates]) =>
      (new OverallSummaryDtoBuilder()..update(updates))._build();

  _$OverallSummaryDto._(
      {required this.totalReports,
      required this.resolvedReports,
      required this.inInvestigationReports,
      required this.receivedReports,
      required this.falseReports,
      required this.resolutionRate,
      required this.avgResolutionHours,
      required this.reportsPer30Days,
      required this.reportsLast7Days,
      required this.reportsLast30Days,
      required this.reportsLast90Days,
      this.last30DaysChangePercent})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        totalReports, r'OverallSummaryDto', 'totalReports');
    BuiltValueNullFieldError.checkNotNull(
        resolvedReports, r'OverallSummaryDto', 'resolvedReports');
    BuiltValueNullFieldError.checkNotNull(
        inInvestigationReports, r'OverallSummaryDto', 'inInvestigationReports');
    BuiltValueNullFieldError.checkNotNull(
        receivedReports, r'OverallSummaryDto', 'receivedReports');
    BuiltValueNullFieldError.checkNotNull(
        falseReports, r'OverallSummaryDto', 'falseReports');
    BuiltValueNullFieldError.checkNotNull(
        resolutionRate, r'OverallSummaryDto', 'resolutionRate');
    BuiltValueNullFieldError.checkNotNull(
        avgResolutionHours, r'OverallSummaryDto', 'avgResolutionHours');
    BuiltValueNullFieldError.checkNotNull(
        reportsPer30Days, r'OverallSummaryDto', 'reportsPer30Days');
    BuiltValueNullFieldError.checkNotNull(
        reportsLast7Days, r'OverallSummaryDto', 'reportsLast7Days');
    BuiltValueNullFieldError.checkNotNull(
        reportsLast30Days, r'OverallSummaryDto', 'reportsLast30Days');
    BuiltValueNullFieldError.checkNotNull(
        reportsLast90Days, r'OverallSummaryDto', 'reportsLast90Days');
  }

  @override
  OverallSummaryDto rebuild(void Function(OverallSummaryDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OverallSummaryDtoBuilder toBuilder() =>
      new OverallSummaryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OverallSummaryDto &&
        totalReports == other.totalReports &&
        resolvedReports == other.resolvedReports &&
        inInvestigationReports == other.inInvestigationReports &&
        receivedReports == other.receivedReports &&
        falseReports == other.falseReports &&
        resolutionRate == other.resolutionRate &&
        avgResolutionHours == other.avgResolutionHours &&
        reportsPer30Days == other.reportsPer30Days &&
        reportsLast7Days == other.reportsLast7Days &&
        reportsLast30Days == other.reportsLast30Days &&
        reportsLast90Days == other.reportsLast90Days &&
        last30DaysChangePercent == other.last30DaysChangePercent;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, totalReports.hashCode);
    _$hash = $jc(_$hash, resolvedReports.hashCode);
    _$hash = $jc(_$hash, inInvestigationReports.hashCode);
    _$hash = $jc(_$hash, receivedReports.hashCode);
    _$hash = $jc(_$hash, falseReports.hashCode);
    _$hash = $jc(_$hash, resolutionRate.hashCode);
    _$hash = $jc(_$hash, avgResolutionHours.hashCode);
    _$hash = $jc(_$hash, reportsPer30Days.hashCode);
    _$hash = $jc(_$hash, reportsLast7Days.hashCode);
    _$hash = $jc(_$hash, reportsLast30Days.hashCode);
    _$hash = $jc(_$hash, reportsLast90Days.hashCode);
    _$hash = $jc(_$hash, last30DaysChangePercent.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OverallSummaryDto')
          ..add('totalReports', totalReports)
          ..add('resolvedReports', resolvedReports)
          ..add('inInvestigationReports', inInvestigationReports)
          ..add('receivedReports', receivedReports)
          ..add('falseReports', falseReports)
          ..add('resolutionRate', resolutionRate)
          ..add('avgResolutionHours', avgResolutionHours)
          ..add('reportsPer30Days', reportsPer30Days)
          ..add('reportsLast7Days', reportsLast7Days)
          ..add('reportsLast30Days', reportsLast30Days)
          ..add('reportsLast90Days', reportsLast90Days)
          ..add('last30DaysChangePercent', last30DaysChangePercent))
        .toString();
  }
}

class OverallSummaryDtoBuilder
    implements Builder<OverallSummaryDto, OverallSummaryDtoBuilder> {
  _$OverallSummaryDto? _$v;

  num? _totalReports;
  num? get totalReports => _$this._totalReports;
  set totalReports(num? totalReports) => _$this._totalReports = totalReports;

  num? _resolvedReports;
  num? get resolvedReports => _$this._resolvedReports;
  set resolvedReports(num? resolvedReports) =>
      _$this._resolvedReports = resolvedReports;

  num? _inInvestigationReports;
  num? get inInvestigationReports => _$this._inInvestigationReports;
  set inInvestigationReports(num? inInvestigationReports) =>
      _$this._inInvestigationReports = inInvestigationReports;

  num? _receivedReports;
  num? get receivedReports => _$this._receivedReports;
  set receivedReports(num? receivedReports) =>
      _$this._receivedReports = receivedReports;

  num? _falseReports;
  num? get falseReports => _$this._falseReports;
  set falseReports(num? falseReports) => _$this._falseReports = falseReports;

  num? _resolutionRate;
  num? get resolutionRate => _$this._resolutionRate;
  set resolutionRate(num? resolutionRate) =>
      _$this._resolutionRate = resolutionRate;

  num? _avgResolutionHours;
  num? get avgResolutionHours => _$this._avgResolutionHours;
  set avgResolutionHours(num? avgResolutionHours) =>
      _$this._avgResolutionHours = avgResolutionHours;

  num? _reportsPer30Days;
  num? get reportsPer30Days => _$this._reportsPer30Days;
  set reportsPer30Days(num? reportsPer30Days) =>
      _$this._reportsPer30Days = reportsPer30Days;

  num? _reportsLast7Days;
  num? get reportsLast7Days => _$this._reportsLast7Days;
  set reportsLast7Days(num? reportsLast7Days) =>
      _$this._reportsLast7Days = reportsLast7Days;

  num? _reportsLast30Days;
  num? get reportsLast30Days => _$this._reportsLast30Days;
  set reportsLast30Days(num? reportsLast30Days) =>
      _$this._reportsLast30Days = reportsLast30Days;

  num? _reportsLast90Days;
  num? get reportsLast90Days => _$this._reportsLast90Days;
  set reportsLast90Days(num? reportsLast90Days) =>
      _$this._reportsLast90Days = reportsLast90Days;

  num? _last30DaysChangePercent;
  num? get last30DaysChangePercent => _$this._last30DaysChangePercent;
  set last30DaysChangePercent(num? last30DaysChangePercent) =>
      _$this._last30DaysChangePercent = last30DaysChangePercent;

  OverallSummaryDtoBuilder() {
    OverallSummaryDto._defaults(this);
  }

  OverallSummaryDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _totalReports = $v.totalReports;
      _resolvedReports = $v.resolvedReports;
      _inInvestigationReports = $v.inInvestigationReports;
      _receivedReports = $v.receivedReports;
      _falseReports = $v.falseReports;
      _resolutionRate = $v.resolutionRate;
      _avgResolutionHours = $v.avgResolutionHours;
      _reportsPer30Days = $v.reportsPer30Days;
      _reportsLast7Days = $v.reportsLast7Days;
      _reportsLast30Days = $v.reportsLast30Days;
      _reportsLast90Days = $v.reportsLast90Days;
      _last30DaysChangePercent = $v.last30DaysChangePercent;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OverallSummaryDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OverallSummaryDto;
  }

  @override
  void update(void Function(OverallSummaryDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OverallSummaryDto build() => _build();

  _$OverallSummaryDto _build() {
    final _$result = _$v ??
        new _$OverallSummaryDto._(
            totalReports: BuiltValueNullFieldError.checkNotNull(
                totalReports, r'OverallSummaryDto', 'totalReports'),
            resolvedReports: BuiltValueNullFieldError.checkNotNull(
                resolvedReports, r'OverallSummaryDto', 'resolvedReports'),
            inInvestigationReports: BuiltValueNullFieldError.checkNotNull(
                inInvestigationReports, r'OverallSummaryDto', 'inInvestigationReports'),
            receivedReports: BuiltValueNullFieldError.checkNotNull(
                receivedReports, r'OverallSummaryDto', 'receivedReports'),
            falseReports: BuiltValueNullFieldError.checkNotNull(
                falseReports, r'OverallSummaryDto', 'falseReports'),
            resolutionRate: BuiltValueNullFieldError.checkNotNull(
                resolutionRate, r'OverallSummaryDto', 'resolutionRate'),
            avgResolutionHours: BuiltValueNullFieldError.checkNotNull(
                avgResolutionHours, r'OverallSummaryDto', 'avgResolutionHours'),
            reportsPer30Days: BuiltValueNullFieldError.checkNotNull(reportsPer30Days, r'OverallSummaryDto', 'reportsPer30Days'),
            reportsLast7Days: BuiltValueNullFieldError.checkNotNull(reportsLast7Days, r'OverallSummaryDto', 'reportsLast7Days'),
            reportsLast30Days: BuiltValueNullFieldError.checkNotNull(reportsLast30Days, r'OverallSummaryDto', 'reportsLast30Days'),
            reportsLast90Days: BuiltValueNullFieldError.checkNotNull(reportsLast90Days, r'OverallSummaryDto', 'reportsLast90Days'),
            last30DaysChangePercent: last30DaysChangePercent);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
