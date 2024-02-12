//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/status_records_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'public_report_dto.g.dart';

/// PublicReportDto
///
/// Properties:
/// * [name]
/// * [category]
/// * [refId]
/// * [longitude]
/// * [latitude]
/// * [comment]
/// * [status]
/// * [reportDate]
/// * [officerImageUrls]
/// * [imageUrls]
/// * [statusRecords]
@BuiltValue()
abstract class PublicReportDto
    implements Built<PublicReportDto, PublicReportDtoBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'category')
  PublicReportDtoCategoryEnum get category;
  // enum categoryEnum {  trash,  forest,  };

  @BuiltValueField(wireName: r'refId')
  String get refId;

  @BuiltValueField(wireName: r'longitude')
  double get longitude;

  @BuiltValueField(wireName: r'latitude')
  double get latitude;

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

  @BuiltValueField(wireName: r'statusRecords')
  BuiltList<StatusRecordsDto> get statusRecords;

  PublicReportDto._();

  factory PublicReportDto([void updates(PublicReportDtoBuilder b)]) =
      _$PublicReportDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PublicReportDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PublicReportDto> get serializer =>
      _$PublicReportDtoSerializer();
}

class _$PublicReportDtoSerializer
    implements PrimitiveSerializer<PublicReportDto> {
  @override
  final Iterable<Type> types = const [PublicReportDto, _$PublicReportDto];

  @override
  final String wireName = r'PublicReportDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PublicReportDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'category';
    yield serializers.serialize(
      object.category,
      specifiedType: const FullType(PublicReportDtoCategoryEnum),
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
    yield r'statusRecords';
    yield serializers.serialize(
      object.statusRecords,
      specifiedType: const FullType(BuiltList, [FullType(StatusRecordsDto)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PublicReportDto object, {
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
    required PublicReportDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
            specifiedType: const FullType(PublicReportDtoCategoryEnum),
          ) as PublicReportDtoCategoryEnum;
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
        case r'statusRecords':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(StatusRecordsDto)]),
          ) as BuiltList<StatusRecordsDto>;
          result.statusRecords.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PublicReportDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PublicReportDtoBuilder();
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

class PublicReportDtoCategoryEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'trash')
  static const PublicReportDtoCategoryEnum trash =
      _$publicReportDtoCategoryEnum_trash;
  @BuiltValueEnumConst(wireName: r'forest', fallback: true)
  static const PublicReportDtoCategoryEnum forest =
      _$publicReportDtoCategoryEnum_forest;

  static Serializer<PublicReportDtoCategoryEnum> get serializer =>
      _$publicReportDtoCategoryEnumSerializer;

  const PublicReportDtoCategoryEnum._(String name) : super(name);

  static BuiltSet<PublicReportDtoCategoryEnum> get values =>
      _$publicReportDtoCategoryEnumValues;
  static PublicReportDtoCategoryEnum valueOf(String name) =>
      _$publicReportDtoCategoryEnumValueOf(name);
}
