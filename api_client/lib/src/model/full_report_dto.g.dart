// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_report_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const FullReportDtoCategoryEnum _$fullReportDtoCategoryEnum_trash =
    const FullReportDtoCategoryEnum._('trash');
const FullReportDtoCategoryEnum _$fullReportDtoCategoryEnum_forest =
    const FullReportDtoCategoryEnum._('forest');
const FullReportDtoCategoryEnum _$fullReportDtoCategoryEnum_beetle =
    const FullReportDtoCategoryEnum._('beetle');

FullReportDtoCategoryEnum _$fullReportDtoCategoryEnumValueOf(String name) {
  switch (name) {
    case 'trash':
      return _$fullReportDtoCategoryEnum_trash;
    case 'forest':
      return _$fullReportDtoCategoryEnum_forest;
    case 'beetle':
      return _$fullReportDtoCategoryEnum_beetle;
    default:
      return _$fullReportDtoCategoryEnum_beetle;
  }
}

final BuiltSet<FullReportDtoCategoryEnum> _$fullReportDtoCategoryEnumValues =
    new BuiltSet<FullReportDtoCategoryEnum>(const <FullReportDtoCategoryEnum>[
  _$fullReportDtoCategoryEnum_trash,
  _$fullReportDtoCategoryEnum_forest,
  _$fullReportDtoCategoryEnum_beetle,
]);

Serializer<FullReportDtoCategoryEnum> _$fullReportDtoCategoryEnumSerializer =
    new _$FullReportDtoCategoryEnumSerializer();

class _$FullReportDtoCategoryEnumSerializer
    implements PrimitiveSerializer<FullReportDtoCategoryEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'trash': 'trash',
    'forest': 'forest',
    'beetle': 'beetle',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'trash': 'trash',
    'forest': 'forest',
    'beetle': 'beetle',
  };

  @override
  final Iterable<Type> types = const <Type>[FullReportDtoCategoryEnum];
  @override
  final String wireName = 'FullReportDtoCategoryEnum';

  @override
  Object serialize(Serializers serializers, FullReportDtoCategoryEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  FullReportDtoCategoryEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      FullReportDtoCategoryEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$FullReportDto extends FullReportDto {
  @override
  final String id;
  @override
  final String name;
  @override
  final FullReportDtoCategoryEnum category;
  @override
  final String refId;
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final String email;
  @override
  final bool isVisible;
  @override
  final bool isDeleted;
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
  final BuiltList<HistoryDataDto> historyData;
  @override
  final BuiltList<StatusRecordsDto> statusRecords;

  factory _$FullReportDto([void Function(FullReportDtoBuilder)? updates]) =>
      (new FullReportDtoBuilder()..update(updates))._build();

  _$FullReportDto._(
      {required this.id,
      required this.name,
      required this.category,
      required this.refId,
      required this.longitude,
      required this.latitude,
      required this.email,
      required this.isVisible,
      required this.isDeleted,
      required this.comment,
      required this.status,
      required this.reportDate,
      required this.officerImageUrls,
      required this.imageUrls,
      required this.historyData,
      required this.statusRecords})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'FullReportDto', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'FullReportDto', 'name');
    BuiltValueNullFieldError.checkNotNull(
        category, r'FullReportDto', 'category');
    BuiltValueNullFieldError.checkNotNull(refId, r'FullReportDto', 'refId');
    BuiltValueNullFieldError.checkNotNull(
        longitude, r'FullReportDto', 'longitude');
    BuiltValueNullFieldError.checkNotNull(
        latitude, r'FullReportDto', 'latitude');
    BuiltValueNullFieldError.checkNotNull(email, r'FullReportDto', 'email');
    BuiltValueNullFieldError.checkNotNull(
        isVisible, r'FullReportDto', 'isVisible');
    BuiltValueNullFieldError.checkNotNull(
        isDeleted, r'FullReportDto', 'isDeleted');
    BuiltValueNullFieldError.checkNotNull(comment, r'FullReportDto', 'comment');
    BuiltValueNullFieldError.checkNotNull(status, r'FullReportDto', 'status');
    BuiltValueNullFieldError.checkNotNull(
        reportDate, r'FullReportDto', 'reportDate');
    BuiltValueNullFieldError.checkNotNull(
        officerImageUrls, r'FullReportDto', 'officerImageUrls');
    BuiltValueNullFieldError.checkNotNull(
        imageUrls, r'FullReportDto', 'imageUrls');
    BuiltValueNullFieldError.checkNotNull(
        historyData, r'FullReportDto', 'historyData');
    BuiltValueNullFieldError.checkNotNull(
        statusRecords, r'FullReportDto', 'statusRecords');
  }

  @override
  FullReportDto rebuild(void Function(FullReportDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FullReportDtoBuilder toBuilder() => new FullReportDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FullReportDto &&
        id == other.id &&
        name == other.name &&
        category == other.category &&
        refId == other.refId &&
        longitude == other.longitude &&
        latitude == other.latitude &&
        email == other.email &&
        isVisible == other.isVisible &&
        isDeleted == other.isDeleted &&
        comment == other.comment &&
        status == other.status &&
        reportDate == other.reportDate &&
        officerImageUrls == other.officerImageUrls &&
        imageUrls == other.imageUrls &&
        historyData == other.historyData &&
        statusRecords == other.statusRecords;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, category.hashCode);
    _$hash = $jc(_$hash, refId.hashCode);
    _$hash = $jc(_$hash, longitude.hashCode);
    _$hash = $jc(_$hash, latitude.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, isVisible.hashCode);
    _$hash = $jc(_$hash, isDeleted.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, reportDate.hashCode);
    _$hash = $jc(_$hash, officerImageUrls.hashCode);
    _$hash = $jc(_$hash, imageUrls.hashCode);
    _$hash = $jc(_$hash, historyData.hashCode);
    _$hash = $jc(_$hash, statusRecords.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FullReportDto')
          ..add('id', id)
          ..add('name', name)
          ..add('category', category)
          ..add('refId', refId)
          ..add('longitude', longitude)
          ..add('latitude', latitude)
          ..add('email', email)
          ..add('isVisible', isVisible)
          ..add('isDeleted', isDeleted)
          ..add('comment', comment)
          ..add('status', status)
          ..add('reportDate', reportDate)
          ..add('officerImageUrls', officerImageUrls)
          ..add('imageUrls', imageUrls)
          ..add('historyData', historyData)
          ..add('statusRecords', statusRecords))
        .toString();
  }
}

class FullReportDtoBuilder
    implements Builder<FullReportDto, FullReportDtoBuilder> {
  _$FullReportDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  FullReportDtoCategoryEnum? _category;
  FullReportDtoCategoryEnum? get category => _$this._category;
  set category(FullReportDtoCategoryEnum? category) =>
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

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  bool? _isVisible;
  bool? get isVisible => _$this._isVisible;
  set isVisible(bool? isVisible) => _$this._isVisible = isVisible;

  bool? _isDeleted;
  bool? get isDeleted => _$this._isDeleted;
  set isDeleted(bool? isDeleted) => _$this._isDeleted = isDeleted;

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

  ListBuilder<HistoryDataDto>? _historyData;
  ListBuilder<HistoryDataDto> get historyData =>
      _$this._historyData ??= new ListBuilder<HistoryDataDto>();
  set historyData(ListBuilder<HistoryDataDto>? historyData) =>
      _$this._historyData = historyData;

  ListBuilder<StatusRecordsDto>? _statusRecords;
  ListBuilder<StatusRecordsDto> get statusRecords =>
      _$this._statusRecords ??= new ListBuilder<StatusRecordsDto>();
  set statusRecords(ListBuilder<StatusRecordsDto>? statusRecords) =>
      _$this._statusRecords = statusRecords;

  FullReportDtoBuilder() {
    FullReportDto._defaults(this);
  }

  FullReportDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _category = $v.category;
      _refId = $v.refId;
      _longitude = $v.longitude;
      _latitude = $v.latitude;
      _email = $v.email;
      _isVisible = $v.isVisible;
      _isDeleted = $v.isDeleted;
      _comment = $v.comment;
      _status = $v.status;
      _reportDate = $v.reportDate;
      _officerImageUrls = $v.officerImageUrls.toBuilder();
      _imageUrls = $v.imageUrls.toBuilder();
      _historyData = $v.historyData.toBuilder();
      _statusRecords = $v.statusRecords.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FullReportDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FullReportDto;
  }

  @override
  void update(void Function(FullReportDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FullReportDto build() => _build();

  _$FullReportDto _build() {
    _$FullReportDto _$result;
    try {
      _$result = _$v ??
          new _$FullReportDto._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'FullReportDto', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'FullReportDto', 'name'),
              category: BuiltValueNullFieldError.checkNotNull(
                  category, r'FullReportDto', 'category'),
              refId: BuiltValueNullFieldError.checkNotNull(
                  refId, r'FullReportDto', 'refId'),
              longitude: BuiltValueNullFieldError.checkNotNull(
                  longitude, r'FullReportDto', 'longitude'),
              latitude: BuiltValueNullFieldError.checkNotNull(
                  latitude, r'FullReportDto', 'latitude'),
              email: BuiltValueNullFieldError.checkNotNull(
                  email, r'FullReportDto', 'email'),
              isVisible: BuiltValueNullFieldError.checkNotNull(
                  isVisible, r'FullReportDto', 'isVisible'),
              isDeleted: BuiltValueNullFieldError.checkNotNull(
                  isDeleted, r'FullReportDto', 'isDeleted'),
              comment:
                  BuiltValueNullFieldError.checkNotNull(comment, r'FullReportDto', 'comment'),
              status: BuiltValueNullFieldError.checkNotNull(status, r'FullReportDto', 'status'),
              reportDate: BuiltValueNullFieldError.checkNotNull(reportDate, r'FullReportDto', 'reportDate'),
              officerImageUrls: officerImageUrls.build(),
              imageUrls: imageUrls.build(),
              historyData: historyData.build(),
              statusRecords: statusRecords.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'officerImageUrls';
        officerImageUrls.build();
        _$failedField = 'imageUrls';
        imageUrls.build();
        _$failedField = 'historyData';
        historyData.build();
        _$failedField = 'statusRecords';
        statusRecords.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FullReportDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
