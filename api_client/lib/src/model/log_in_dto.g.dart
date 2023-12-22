// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_in_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LogInDto extends LogInDto {
  @override
  final String name;
  @override
  final String email;
  @override
  final String accessKey;

  factory _$LogInDto([void Function(LogInDtoBuilder)? updates]) =>
      (new LogInDtoBuilder()..update(updates))._build();

  _$LogInDto._(
      {required this.name, required this.email, required this.accessKey})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'LogInDto', 'name');
    BuiltValueNullFieldError.checkNotNull(email, r'LogInDto', 'email');
    BuiltValueNullFieldError.checkNotNull(accessKey, r'LogInDto', 'accessKey');
  }

  @override
  LogInDto rebuild(void Function(LogInDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogInDtoBuilder toBuilder() => new LogInDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogInDto &&
        name == other.name &&
        email == other.email &&
        accessKey == other.accessKey;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, accessKey.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LogInDto')
          ..add('name', name)
          ..add('email', email)
          ..add('accessKey', accessKey))
        .toString();
  }
}

class LogInDtoBuilder implements Builder<LogInDto, LogInDtoBuilder> {
  _$LogInDto? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _accessKey;
  String? get accessKey => _$this._accessKey;
  set accessKey(String? accessKey) => _$this._accessKey = accessKey;

  LogInDtoBuilder() {
    LogInDto._defaults(this);
  }

  LogInDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _email = $v.email;
      _accessKey = $v.accessKey;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LogInDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LogInDto;
  }

  @override
  void update(void Function(LogInDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LogInDto build() => _build();

  _$LogInDto _build() {
    final _$result = _$v ??
        new _$LogInDto._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'LogInDto', 'name'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'LogInDto', 'email'),
            accessKey: BuiltValueNullFieldError.checkNotNull(
                accessKey, r'LogInDto', 'accessKey'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
