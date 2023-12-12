// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_edits_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HistoryEditsDto extends HistoryEditsDto {
  @override
  final String field;
  @override
  final String change;

  factory _$HistoryEditsDto([void Function(HistoryEditsDtoBuilder)? updates]) =>
      (new HistoryEditsDtoBuilder()..update(updates))._build();

  _$HistoryEditsDto._({required this.field, required this.change}) : super._() {
    BuiltValueNullFieldError.checkNotNull(field, r'HistoryEditsDto', 'field');
    BuiltValueNullFieldError.checkNotNull(change, r'HistoryEditsDto', 'change');
  }

  @override
  HistoryEditsDto rebuild(void Function(HistoryEditsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HistoryEditsDtoBuilder toBuilder() =>
      new HistoryEditsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HistoryEditsDto &&
        field == other.field &&
        change == other.change;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, field.hashCode);
    _$hash = $jc(_$hash, change.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HistoryEditsDto')
          ..add('field', field)
          ..add('change', change))
        .toString();
  }
}

class HistoryEditsDtoBuilder
    implements Builder<HistoryEditsDto, HistoryEditsDtoBuilder> {
  _$HistoryEditsDto? _$v;

  String? _field;
  String? get field => _$this._field;
  set field(String? field) => _$this._field = field;

  String? _change;
  String? get change => _$this._change;
  set change(String? change) => _$this._change = change;

  HistoryEditsDtoBuilder() {
    HistoryEditsDto._defaults(this);
  }

  HistoryEditsDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _field = $v.field;
      _change = $v.change;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HistoryEditsDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HistoryEditsDto;
  }

  @override
  void update(void Function(HistoryEditsDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HistoryEditsDto build() => _build();

  _$HistoryEditsDto _build() {
    final _$result = _$v ??
        new _$HistoryEditsDto._(
            field: BuiltValueNullFieldError.checkNotNull(
                field, r'HistoryEditsDto', 'field'),
            change: BuiltValueNullFieldError.checkNotNull(
                change, r'HistoryEditsDto', 'change'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
