// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_report_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PublicReportDtoCategoryEnum _$publicReportDtoCategoryEnum_trash =
    const PublicReportDtoCategoryEnum._('trash');
const PublicReportDtoCategoryEnum _$publicReportDtoCategoryEnum_forest =
    const PublicReportDtoCategoryEnum._('forest');
const PublicReportDtoCategoryEnum _$publicReportDtoCategoryEnum_beetle =
    const PublicReportDtoCategoryEnum._('beetle');
const PublicReportDtoCategoryEnum _$publicReportDtoCategoryEnum_permits =
    const PublicReportDtoCategoryEnum._('permits');
const PublicReportDtoCategoryEnum _$publicReportDtoCategoryEnum_misc =
    const PublicReportDtoCategoryEnum._('misc');

PublicReportDtoCategoryEnum _$publicReportDtoCategoryEnumValueOf(String name) {
  switch (name) {
    case 'trash':
      return _$publicReportDtoCategoryEnum_trash;
    case 'forest':
      return _$publicReportDtoCategoryEnum_forest;
    case 'beetle':
      return _$publicReportDtoCategoryEnum_beetle;
    case 'permits':
      return _$publicReportDtoCategoryEnum_permits;
    case 'misc':
      return _$publicReportDtoCategoryEnum_misc;
    default:
      return _$publicReportDtoCategoryEnum_misc;
  }
}

final BuiltSet<PublicReportDtoCategoryEnum>
    _$publicReportDtoCategoryEnumValues = new BuiltSet<
        PublicReportDtoCategoryEnum>(const <PublicReportDtoCategoryEnum>[
  _$publicReportDtoCategoryEnum_trash,
  _$publicReportDtoCategoryEnum_forest,
  _$publicReportDtoCategoryEnum_beetle,
  _$publicReportDtoCategoryEnum_permits,
  _$publicReportDtoCategoryEnum_misc,
]);

Serializer<PublicReportDtoCategoryEnum>
    _$publicReportDtoCategoryEnumSerializer =
    new _$PublicReportDtoCategoryEnumSerializer();

class _$PublicReportDtoCategoryEnumSerializer
    implements PrimitiveSerializer<PublicReportDtoCategoryEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'trash': 'trash',
    'forest': 'forest',
    'beetle': 'beetle',
    'permits': 'permits',
    'misc': 'misc',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'trash': 'trash',
    'forest': 'forest',
    'beetle': 'beetle',
    'permits': 'permits',
    'misc': 'misc',
  };

  @override
  final Iterable<Type> types = const <Type>[PublicReportDtoCategoryEnum];
  @override
  final String wireName = 'PublicReportDtoCategoryEnum';

  @override
  Object serialize(Serializers serializers, PublicReportDtoCategoryEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  PublicReportDtoCategoryEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PublicReportDtoCategoryEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$PublicReportDto extends PublicReportDto {
  @override
  final String name;
  @override
  final PublicReportDtoCategoryEnum category;
  @override
  final String refId;
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final String comment;
  @override
  final String status;
  @override
  final DateTime reportDate;
  @override
  final BuiltList<String> officerImageUrls;
  @override
  final BuiltList<String> imageUrls;
  @override
  final BuiltList<StatusRecordsDto> statusRecords;

  factory _$PublicReportDto([void Function(PublicReportDtoBuilder)? updates]) =>
      (new PublicReportDtoBuilder()..update(updates))._build();

  _$PublicReportDto._(
      {required this.name,
      required this.category,
      required this.refId,
      required this.longitude,
      required this.latitude,
      required this.comment,
      required this.status,
      required this.reportDate,
      required this.officerImageUrls,
      required this.imageUrls,
      required this.statusRecords})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'PublicReportDto', 'name');
    BuiltValueNullFieldError.checkNotNull(
        category, r'PublicReportDto', 'category');
    BuiltValueNullFieldError.checkNotNull(refId, r'PublicReportDto', 'refId');
    BuiltValueNullFieldError.checkNotNull(
        longitude, r'PublicReportDto', 'longitude');
    BuiltValueNullFieldError.checkNotNull(
        latitude, r'PublicReportDto', 'latitude');
    BuiltValueNullFieldError.checkNotNull(
        comment, r'PublicReportDto', 'comment');
    BuiltValueNullFieldError.checkNotNull(status, r'PublicReportDto', 'status');
    BuiltValueNullFieldError.checkNotNull(
        reportDate, r'PublicReportDto', 'reportDate');
    BuiltValueNullFieldError.checkNotNull(
        officerImageUrls, r'PublicReportDto', 'officerImageUrls');
    BuiltValueNullFieldError.checkNotNull(
        imageUrls, r'PublicReportDto', 'imageUrls');
    BuiltValueNullFieldError.checkNotNull(
        statusRecords, r'PublicReportDto', 'statusRecords');
  }

  @override
  PublicReportDto rebuild(void Function(PublicReportDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PublicReportDtoBuilder toBuilder() =>
      new PublicReportDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PublicReportDto &&
        name == other.name &&
        category == other.category &&
        refId == other.refId &&
        longitude == other.longitude &&
        latitude == other.latitude &&
        comment == other.comment &&
        status == other.status &&
        reportDate == other.reportDate &&
        officerImageUrls == other.officerImageUrls &&
        imageUrls == other.imageUrls &&
        statusRecords == other.statusRecords;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, refId.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, reportDate.hashCode);
    _$hash = $jc(_$hash, officerImageUrls.hashCode);
    _$hash = $jc(_$hash, imageUrls.hashCode);
    _$hash = $jc(_$hash, statusRecords.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PublicReportDto')
          ..add('name', name)
          ..add('category', category)
          ..add('refId', refId)
          ..add('longitude', longitude)
          ..add('latitude', latitude)
          ..add('comment', comment)
          ..add('status', status)
          ..add('reportDate', reportDate)
          ..add('officerImageUrls', officerImageUrls)
          ..add('imageUrls', imageUrls)
          ..add('statusRecords', statusRecords))
        .toString();
  }
}

class PublicReportDtoBuilder
    implements Builder<PublicReportDto, PublicReportDtoBuilder> {
  _$PublicReportDto? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  PublicReportDtoCategoryEnum? _category;
  PublicReportDtoCategoryEnum? get category => _$this._category;
  set category(PublicReportDtoCategoryEnum? category) =>
      _$this._category = category;

  String? _refId;
  String? get refId => _$this._refId;
  set refId(String? refId) => _$this._refId = refId;

  double? _longitude;
  double? get longitude => _$this._longitude;
  set longitude(double? longitude) => _$this._longitude = longitude;

  double? _latitude;
  double? get latitude => _$this._latitude;
  set latitude(double? latitude) => _$this._latitude = latitude;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  DateTime? _reportDate;
  DateTime? get reportDate => _$this._reportDate;
  set reportDate(DateTime? reportDate) => _$this._reportDate = reportDate;

  ListBuilder<String>? _officerImageUrls;
  ListBuilder<String> get officerImageUrls =>
      _$this._officerImageUrls ??= new ListBuilder<String>();
  set officerImageUrls(ListBuilder<String>? officerImageUrls) =>
      _$this._officerImageUrls = officerImageUrls;

  ListBuilder<String>? _imageUrls;
  ListBuilder<String> get imageUrls =>
      _$this._imageUrls ??= new ListBuilder<String>();
  set imageUrls(ListBuilder<String>? imageUrls) =>
      _$this._imageUrls = imageUrls;

  ListBuilder<StatusRecordsDto>? _statusRecords;
  ListBuilder<StatusRecordsDto> get statusRecords =>
      _$this._statusRecords ??= new ListBuilder<StatusRecordsDto>();
  set statusRecords(ListBuilder<StatusRecordsDto>? statusRecords) =>
      _$this._statusRecords = statusRecords;

  PublicReportDtoBuilder() {
    PublicReportDto._defaults(this);
  }

  PublicReportDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _category = $v.category;
      _refId = $v.refId;
      _longitude = $v.longitude;
      _latitude = $v.latitude;
      _comment = $v.comment;
      _status = $v.status;
      _reportDate = $v.reportDate;
      _officerImageUrls = $v.officerImageUrls.toBuilder();
      _imageUrls = $v.imageUrls.toBuilder();
      _statusRecords = $v.statusRecords.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PublicReportDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PublicReportDto;
  }

  @override
  void update(void Function(PublicReportDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PublicReportDto build() => _build();

  _$PublicReportDto _build() {
    _$PublicReportDto _$result;
    try {
      _$result = _$v ??
          new _$PublicReportDto._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'PublicReportDto', 'name'),
              category: BuiltValueNullFieldError.checkNotNull(
                  category, r'PublicReportDto', 'category'),
              refId: BuiltValueNullFieldError.checkNotNull(
                  refId, r'PublicReportDto', 'refId'),
              longitude: BuiltValueNullFieldError.checkNotNull(
                  longitude, r'PublicReportDto', 'longitude'),
              latitude: BuiltValueNullFieldError.checkNotNull(
                  latitude, r'PublicReportDto', 'latitude'),
              comment: BuiltValueNullFieldError.checkNotNull(
                  comment, r'PublicReportDto', 'comment'),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'PublicReportDto', 'status'),
              reportDate: BuiltValueNullFieldError.checkNotNull(
                  reportDate, r'PublicReportDto', 'reportDate'),
              officerImageUrls: officerImageUrls.build(),
              imageUrls: imageUrls.build(),
              statusRecords: statusRecords.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'officerImageUrls';
        officerImageUrls.build();
        _$failedField = 'imageUrls';
        imageUrls.build();
        _$failedField = 'statusRecords';
        statusRecords.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PublicReportDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
