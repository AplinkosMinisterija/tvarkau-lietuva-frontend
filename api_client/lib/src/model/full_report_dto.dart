//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/history_data_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/status_records_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'full_report_dto.g.dart';

/// FullReportDto
///
/// Properties:
/// * [id]
/// * [name]
/// * [category]
/// * [refId]
/// * [longitude]
/// * [latitude]
/// * [email]
/// * [isVisible]
/// * [isDeleted]
/// * [comment]
/// * [status]
/// * [reportDate]
/// * [officerImageUrls]
/// * [imageUrls]
/// * [historyData]
/// * [statusRecords]
/// * [emailFeedbackStage]
/// * [inspection]
/// * [inspectionId]
/// * [isTransferred]
@BuiltValue()
abstract class FullReportDto
    implements Built<FullReportDto, FullReportDtoBuilder> {
  @BuiltValueField(wireName: r'_id')
  String get id;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'category')
  FullReportDtoCategoryEnum get category;
  // enum categoryEnum {  trash,  forest,  beetle,  permits,  };

  @BuiltValueField(wireName: r'refId')
  String get refId;

  @BuiltValueField(wireName: r'longitude')
  double get longitude;

  @BuiltValueField(wireName: r'latitude')
  double get latitude;

  @BuiltValueField(wireName: r'email')
  String get email;

  @BuiltValueField(wireName: r'isVisible')
  bool get isVisible;

  @BuiltValueField(wireName: r'isDeleted')
  bool get isDeleted;

  @BuiltValueField(wireName: r'comment')
  String get comment;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'reportDate')
  DateTime get reportDate;

  @BuiltValueField(wireName: r'officerImageUrls')
  BuiltList<String> get officerImageUrls;

  @BuiltValueField(wireName: r'imageUrls')
  BuiltList<String> get imageUrls;

  @BuiltValueField(wireName: r'historyData')
  BuiltList<HistoryDataDto> get historyData;

  @BuiltValueField(wireName: r'statusRecords')
  BuiltList<StatusRecordsDto> get statusRecords;

  @BuiltValueField(wireName: r'emailFeedbackStage')
  double get emailFeedbackStage;

  @BuiltValueField(wireName: r'inspection')
  String? get inspection;

  @BuiltValueField(wireName: r'inspectionId')
  String? get inspectionId;

  @BuiltValueField(wireName: r'isTransferred')
  bool? get isTransferred;

  FullReportDto._();

  factory FullReportDto([void updates(FullReportDtoBuilder b)]) =
      _$FullReportDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FullReportDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FullReportDto> get serializer =>
      _$FullReportDtoSerializer();
}

class _$FullReportDtoSerializer implements PrimitiveSerializer<FullReportDto> {
  @override
  final Iterable<Type> types = const [FullReportDto, _$FullReportDto];

  @override
  final String wireName = r'FullReportDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FullReportDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'_id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'category';
    yield serializers.serialize(
      object.category,
      specifiedType: const FullType(FullReportDtoCategoryEnum),
    );
    yield r'refId';
    yield serializers.serialize(
      object.refId,
      specifiedType: const FullType(String),
    );
    yield r'longitude';
    yield serializers.serialize(
      object.longitude,
      specifiedType: const FullType(double),
    );
    yield r'latitude';
    yield serializers.serialize(
      object.latitude,
      specifiedType: const FullType(double),
    );
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
    yield r'isVisible';
    yield serializers.serialize(
      object.isVisible,
      specifiedType: const FullType(bool),
    );
    yield r'isDeleted';
    yield serializers.serialize(
      object.isDeleted,
      specifiedType: const FullType(bool),
    );
    yield r'comment';
    yield serializers.serialize(
      object.comment,
      specifiedType: const FullType(String),
    );
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    yield r'reportDate';
    yield serializers.serialize(
      object.reportDate,
      specifiedType: const FullType(DateTime),
    );
    yield r'officerImageUrls';
    yield serializers.serialize(
      object.officerImageUrls,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'imageUrls';
    yield serializers.serialize(
      object.imageUrls,
      specifiedType: const FullType(BuiltList, [FullType(String)]),
    );
    yield r'historyData';
    yield serializers.serialize(
      object.historyData,
      specifiedType: const FullType(BuiltList, [FullType(HistoryDataDto)]),
    );
    yield r'statusRecords';
    yield serializers.serialize(
      object.statusRecords,
      specifiedType: const FullType(BuiltList, [FullType(StatusRecordsDto)]),
    );
    yield r'emailFeedbackStage';
    yield serializers.serialize(
      object.emailFeedbackStage,
      specifiedType: const FullType(double),
    );
    if (object.inspection != null) {
      yield r'inspection';
      yield serializers.serialize(
        object.inspection,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.inspectionId != null) {
      yield r'inspectionId';
      yield serializers.serialize(
        object.inspectionId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.isTransferred != null) {
      yield r'isTransferred';
      yield serializers.serialize(
        object.isTransferred,
        specifiedType: const FullType.nullable(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    FullReportDto object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required FullReportDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'category':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(FullReportDtoCategoryEnum),
          ) as FullReportDtoCategoryEnum;
          result.category = valueDes;
          break;
        case r'refId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.refId = valueDes;
          break;
        case r'longitude':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.longitude = valueDes;
          break;
        case r'latitude':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.latitude = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'isVisible':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isVisible = valueDes;
          break;
        case r'isDeleted':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isDeleted = valueDes;
          break;
        case r'comment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.comment = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'reportDate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.reportDate = valueDes;
          break;
        case r'officerImageUrls':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.officerImageUrls.replace(valueDes);
          break;
        case r'imageUrls':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.imageUrls.replace(valueDes);
          break;
        case r'historyData':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(HistoryDataDto)]),
          ) as BuiltList<HistoryDataDto>;
          result.historyData.replace(valueDes);
          break;
        case r'statusRecords':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(StatusRecordsDto)]),
          ) as BuiltList<StatusRecordsDto>;
          result.statusRecords.replace(valueDes);
          break;
        case r'emailFeedbackStage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.emailFeedbackStage = valueDes;
          break;
        case r'inspection':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.inspection = valueDes;
          break;
        case r'inspectionId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.inspectionId = valueDes;
          break;
        case r'isTransferred':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isTransferred = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  FullReportDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FullReportDtoBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

class FullReportDtoCategoryEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'trash')
  static const FullReportDtoCategoryEnum trash =
      _$fullReportDtoCategoryEnum_trash;
  @BuiltValueEnumConst(wireName: r'forest')
  static const FullReportDtoCategoryEnum forest =
      _$fullReportDtoCategoryEnum_forest;
  @BuiltValueEnumConst(wireName: r'beetle')
  static const FullReportDtoCategoryEnum beetle =
      _$fullReportDtoCategoryEnum_beetle;
  @BuiltValueEnumConst(wireName: r'permits', fallback: true)
  static const FullReportDtoCategoryEnum permits =
      _$fullReportDtoCategoryEnum_permits;

  static Serializer<FullReportDtoCategoryEnum> get serializer =>
      _$fullReportDtoCategoryEnumSerializer;

  const FullReportDtoCategoryEnum._(String name) : super(name);

  static BuiltSet<FullReportDtoCategoryEnum> get values =>
      _$fullReportDtoCategoryEnumValues;
  static FullReportDtoCategoryEnum valueOf(String name) =>
      _$fullReportDtoCategoryEnumValueOf(name);
}
