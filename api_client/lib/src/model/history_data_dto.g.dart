// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_data_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HistoryDataDto extends HistoryDataDto {
  @override
  final String user;
  @override
  final DateTime date;
  @override
  final BuiltList<HistoryEditsDto> edits;

  factory _$HistoryDataDto([void Function(HistoryDataDtoBuilder)? updates]) =>
      (new HistoryDataDtoBuilder()..update(updates))._build();

  _$HistoryDataDto._(
      {required this.user, required this.date, required this.edits})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(user, r'HistoryDataDto', 'user');
    BuiltValueNullFieldError.checkNotNull(date, r'HistoryDataDto', 'date');
    BuiltValueNullFieldError.checkNotNull(edits, r'HistoryDataDto', 'edits');
  }

  @override
  HistoryDataDto rebuild(void Function(HistoryDataDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HistoryDataDtoBuilder toBuilder() =>
      new HistoryDataDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HistoryDataDto &&
        user == other.user &&
        date == other.date &&
        edits == other.edits;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, edits.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HistoryDataDto')
          ..add('user', user)
          ..add('date', date)
          ..add('edits', edits))
        .toString();
  }
}

class HistoryDataDtoBuilder
    implements Builder<HistoryDataDto, HistoryDataDtoBuilder> {
  _$HistoryDataDto? _$v;

  String? _user;
  String? get user => _$this._user;
  set user(String? user) => _$this._user = user;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  ListBuilder<HistoryEditsDto>? _edits;
  ListBuilder<HistoryEditsDto> get edits =>
      _$this._edits ??= new ListBuilder<HistoryEditsDto>();
  set edits(ListBuilder<HistoryEditsDto>? edits) => _$this._edits = edits;

  HistoryDataDtoBuilder() {
    HistoryDataDto._defaults(this);
  }

  HistoryDataDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _date = $v.date;
      _edits = $v.edits.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HistoryDataDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HistoryDataDto;
  }

  @override
  void update(void Function(HistoryDataDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HistoryDataDto build() => _build();

  _$HistoryDataDto _build() {
    _$HistoryDataDto _$result;
    try {
      _$result = _$v ??
          new _$HistoryDataDto._(
              user: BuiltValueNullFieldError.checkNotNull(
                  user, r'HistoryDataDto', 'user'),
              date: BuiltValueNullFieldError.checkNotNull(
                  date, r'HistoryDataDto', 'date'),
              edits: edits.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'edits';
        edits.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'HistoryDataDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
