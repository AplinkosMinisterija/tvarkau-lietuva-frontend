// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_distribution_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StatusDistributionItemDto extends StatusDistributionItemDto {
  @override
  final String status;
  @override
  final num count;
  @override
  final num percentage;

  factory _$StatusDistributionItemDto(
          [void Function(StatusDistributionItemDtoBuilder)? updates]) =>
      (new StatusDistributionItemDtoBuilder()..update(updates))._build();

  _$StatusDistributionItemDto._(
      {required this.status, required this.count, required this.percentage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        status, r'StatusDistributionItemDto', 'status');
    BuiltValueNullFieldError.checkNotNull(
        count, r'StatusDistributionItemDto', 'count');
    BuiltValueNullFieldError.checkNotNull(
        percentage, r'StatusDistributionItemDto', 'percentage');
  }

  @override
  StatusDistributionItemDto rebuild(
          void Function(StatusDistributionItemDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StatusDistributionItemDtoBuilder toBuilder() =>
      new StatusDistributionItemDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StatusDistributionItemDto &&
        status == other.status &&
        count == other.count &&
        percentage == other.percentage;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jc(_$hash, percentage.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StatusDistributionItemDto')
          ..add('status', status)
          ..add('count', count)
          ..add('percentage', percentage))
        .toString();
  }
}

class StatusDistributionItemDtoBuilder
    implements
        Builder<StatusDistributionItemDto, StatusDistributionItemDtoBuilder> {
  _$StatusDistributionItemDto? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  num? _count;
  num? get count => _$this._count;
  set count(num? count) => _$this._count = count;

  num? _percentage;
  num? get percentage => _$this._percentage;
  set percentage(num? percentage) => _$this._percentage = percentage;

  StatusDistributionItemDtoBuilder() {
    StatusDistributionItemDto._defaults(this);
  }

  StatusDistributionItemDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _count = $v.count;
      _percentage = $v.percentage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StatusDistributionItemDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StatusDistributionItemDto;
  }

  @override
  void update(void Function(StatusDistributionItemDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StatusDistributionItemDto build() => _build();

  _$StatusDistributionItemDto _build() {
    final _$result = _$v ??
        new _$StatusDistributionItemDto._(
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'StatusDistributionItemDto', 'status'),
            count: BuiltValueNullFieldError.checkNotNull(
                count, r'StatusDistributionItemDto', 'count'),
            percentage: BuiltValueNullFieldError.checkNotNull(
                percentage, r'StatusDistributionItemDto', 'percentage'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
