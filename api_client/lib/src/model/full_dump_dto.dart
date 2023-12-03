//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'full_dump_dto.g.dart';

/// FullDumpDto
///
/// Properties:
/// * [refId]
/// * [name]
/// * [type]
/// * [longitude]
/// * [latitude]
/// * [isVisible]
/// * [address]
/// * [phone]
/// * [workingHours]
/// * [moreInformation]
@BuiltValue()
abstract class FullDumpDto implements Built<FullDumpDto, FullDumpDtoBuilder> {
  @BuiltValueField(wireName: r'refId')
  String get refId;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'type')
  String get type;

  @BuiltValueField(wireName: r'longitude')
  num get longitude;

  @BuiltValueField(wireName: r'latitude')
  num get latitude;

  @BuiltValueField(wireName: r'isVisible')
  bool get isVisible;

  @BuiltValueField(wireName: r'address')
  String get address;

  @BuiltValueField(wireName: r'phone')
  String get phone;

  @BuiltValueField(wireName: r'workingHours')
  String get workingHours;

  @BuiltValueField(wireName: r'moreInformation')
  String get moreInformation;

  FullDumpDto._();

  factory FullDumpDto([void updates(FullDumpDtoBuilder b)]) = _$FullDumpDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FullDumpDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FullDumpDto> get serializer => _$FullDumpDtoSerializer();
}

class _$FullDumpDtoSerializer implements PrimitiveSerializer<FullDumpDto> {
  @override
  final Iterable<Type> types = const [FullDumpDto, _$FullDumpDto];

  @override
  final String wireName = r'FullDumpDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FullDumpDto object, {
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
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(String),
    );
    yield r'longitude';
    yield serializers.serialize(
      object.longitude,
      specifiedType: const FullType(num),
    );
    yield r'latitude';
    yield serializers.serialize(
      object.latitude,
      specifiedType: const FullType(num),
    );
    yield r'isVisible';
    yield serializers.serialize(
      object.isVisible,
      specifiedType: const FullType(bool),
    );
    yield r'address';
    yield serializers.serialize(
      object.address,
      specifiedType: const FullType(String),
    );
    yield r'phone';
    yield serializers.serialize(
      object.phone,
      specifiedType: const FullType(String),
    );
    yield r'workingHours';
    yield serializers.serialize(
      object.workingHours,
      specifiedType: const FullType(String),
    );
    yield r'moreInformation';
    yield serializers.serialize(
      object.moreInformation,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    FullDumpDto object, {
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
    required FullDumpDtoBuilder result,
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
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.type = valueDes;
          break;
        case r'longitude':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.longitude = valueDes;
          break;
        case r'latitude':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.latitude = valueDes;
          break;
        case r'isVisible':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isVisible = valueDes;
          break;
        case r'address':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.address = valueDes;
          break;
        case r'phone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.phone = valueDes;
          break;
        case r'workingHours':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.workingHours = valueDes;
          break;
        case r'moreInformation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.moreInformation = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  FullDumpDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FullDumpDtoBuilder();
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
