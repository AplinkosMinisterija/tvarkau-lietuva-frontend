//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'transfer_report_dto.g.dart';

/// TransferReportDto
///
/// Properties:
/// * [refId]
/// * [name]
/// * [longitude]
/// * [latitude]
/// * [status]
/// * [reportDate]
/// * [email]
@BuiltValue()
abstract class TransferReportDto
    implements Built<TransferReportDto, TransferReportDtoBuilder> {
  @BuiltValueField(wireName: r'refId')
  String get refId;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'longitude')
  double get longitude;

  @BuiltValueField(wireName: r'latitude')
  double get latitude;

  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'reportDate')
  DateTime get reportDate;

  @BuiltValueField(wireName: r'email')
  String get email;

  TransferReportDto._();

  factory TransferReportDto([void updates(TransferReportDtoBuilder b)]) =
      _$TransferReportDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TransferReportDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TransferReportDto> get serializer =>
      _$TransferReportDtoSerializer();
}

class _$TransferReportDtoSerializer
    implements PrimitiveSerializer<TransferReportDto> {
  @override
  final Iterable<Type> types = const [TransferReportDto, _$TransferReportDto];

  @override
  final String wireName = r'TransferReportDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TransferReportDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'refId';
    yield serializers.serialize(
      object.refId,
      specifiedType: const FullType(String),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
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
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TransferReportDto object, {
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
    required TransferReportDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'refId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.refId = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
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
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TransferReportDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TransferReportDtoBuilder();
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
