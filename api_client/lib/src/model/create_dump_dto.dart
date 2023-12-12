//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_dump_dto.g.dart';

/// CreateDumpDto
///
/// Properties:
/// * [name]
/// * [reportLong]
/// * [reportLat]
/// * [address]
/// * [phone]
/// * [workingHours]
/// * [moreInformation]
@BuiltValue()
abstract class CreateDumpDto
    implements Built<CreateDumpDto, CreateDumpDtoBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'reportLong')
  num get reportLong;

  @BuiltValueField(wireName: r'reportLat')
  num get reportLat;

  @BuiltValueField(wireName: r'address')
  String get address;

  @BuiltValueField(wireName: r'phone')
  String get phone;

  @BuiltValueField(wireName: r'workingHours')
  String get workingHours;

  @BuiltValueField(wireName: r'moreInformation')
  String get moreInformation;

  CreateDumpDto._();

  factory CreateDumpDto([void updates(CreateDumpDtoBuilder b)]) =
      _$CreateDumpDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateDumpDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateDumpDto> get serializer =>
      _$CreateDumpDtoSerializer();
}

class _$CreateDumpDtoSerializer implements PrimitiveSerializer<CreateDumpDto> {
  @override
  final Iterable<Type> types = const [CreateDumpDto, _$CreateDumpDto];

  @override
  final String wireName = r'CreateDumpDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateDumpDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'reportLong';
    yield serializers.serialize(
      object.reportLong,
      specifiedType: const FullType(num),
    );
    yield r'reportLat';
    yield serializers.serialize(
      object.reportLat,
      specifiedType: const FullType(num),
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
    CreateDumpDto object, {
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
    required CreateDumpDtoBuilder result,
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
        case r'reportLong':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.reportLong = valueDes;
          break;
        case r'reportLat':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.reportLat = valueDes;
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
  CreateDumpDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateDumpDtoBuilder();
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
