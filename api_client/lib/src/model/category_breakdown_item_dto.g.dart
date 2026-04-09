// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_breakdown_item_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CategoryBreakdownItemDto extends CategoryBreakdownItemDto {
  @override
  final String category;
  @override
  final num count;
  @override
  final num percentage;
  @override
  final num avgResolutionHours;

  factory _$CategoryBreakdownItemDto(
          [void Function(CategoryBreakdownItemDtoBuilder)? updates]) =>
      (new CategoryBreakdownItemDtoBuilder()..update(updates))._build();

  _$CategoryBreakdownItemDto._(
      {required this.category,
      required this.count,
      required this.percentage,
      required this.avgResolutionHours})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        category, r'CategoryBreakdownItemDto', 'category');
    BuiltValueNullFieldError.checkNotNull(
        count, r'CategoryBreakdownItemDto', 'count');
    BuiltValueNullFieldError.checkNotNull(
        percentage, r'CategoryBreakdownItemDto', 'percentage');
    BuiltValueNullFieldError.checkNotNull(
        avgResolutionHours, r'CategoryBreakdownItemDto', 'avgResolutionHours');
  }

  @override
  CategoryBreakdownItemDto rebuild(
          void Function(CategoryBreakdownItemDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryBreakdownItemDtoBuilder toBuilder() =>
      new CategoryBreakdownItemDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoryBreakdownItemDto &&
        category == other.category &&
        count == other.count &&
        percentage == other.percentage &&
        avgResolutionHours == other.avgResolutionHours;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jc(_$hash, percentage.hashCode);
    _$hash = $jc(_$hash, avgResolutionHours.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CategoryBreakdownItemDto')
          ..add('category', category)
          ..add('count', count)
          ..add('percentage', percentage)
          ..add('avgResolutionHours', avgResolutionHours))
        .toString();
  }
}

class CategoryBreakdownItemDtoBuilder
    implements
        Builder<CategoryBreakdownItemDto, CategoryBreakdownItemDtoBuilder> {
  _$CategoryBreakdownItemDto? _$v;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

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

  CategoryBreakdownItemDtoBuilder() {
    CategoryBreakdownItemDto._defaults(this);
  }

  CategoryBreakdownItemDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _category = $v.category;
      _count = $v.count;
      _percentage = $v.percentage;
      _avgResolutionHours = $v.avgResolutionHours;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoryBreakdownItemDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CategoryBreakdownItemDto;
  }

  @override
  void update(void Function(CategoryBreakdownItemDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CategoryBreakdownItemDto build() => _build();

  _$CategoryBreakdownItemDto _build() {
    final _$result = _$v ??
        new _$CategoryBreakdownItemDto._(
            category: BuiltValueNullFieldError.checkNotNull(
                category, r'CategoryBreakdownItemDto', 'category'),
            count: BuiltValueNullFieldError.checkNotNull(
                count, r'CategoryBreakdownItemDto', 'count'),
            percentage: BuiltValueNullFieldError.checkNotNull(
                percentage, r'CategoryBreakdownItemDto', 'percentage'),
            avgResolutionHours: BuiltValueNullFieldError.checkNotNull(
                avgResolutionHours,
                r'CategoryBreakdownItemDto',
                'avgResolutionHours'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
