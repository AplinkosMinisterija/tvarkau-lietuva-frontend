//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'dump_dto.g.dart';

/// DumpDto
///
/// Properties:
/// * [name]
/// * [type]
/// * [reportLong]
/// * [reportLat]
/// * [address]
/// * [phone]
/// * [workingHours]
/// * [moreInformation]
@BuiltValue()
abstract class DumpDto implements Built<DumpDto, DumpDtoBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'type')
  String get type;

  @BuiltValueField(wireName: r'reportLong')
  double get reportLong;

  @BuiltValueField(wireName: r'reportLat')
  double get reportLat;

  @BuiltValueField(wireName: r'address')
  String? get address;

  @BuiltValueField(wireName: r'phone')
  String? get phone;

  @BuiltValueField(wireName: r'workingHours')
  String get workingHours;

  @BuiltValueField(wireName: r'moreInformation')
  String get moreInformation;

  DumpDto._();

  factory DumpDto([void updates(DumpDtoBuilder b)]) = _$DumpDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DumpDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DumpDto> get serializer => _$DumpDtoSerializer();
}

class _$DumpDtoSerializer implements PrimitiveSerializer<DumpDto> {
  @override
  final Iterable<Type> types = const [DumpDto, _$DumpDto];

  @override
  final String wireName = r'DumpDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DumpDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    yield r'reportLong';
    yield serializers.serialize(
      object.reportLong,
      specifiedType: const FullType(double),
    );
    yield r'reportLat';
    yield serializers.serialize(
      object.reportLat,
      specifiedType: const FullType(double),
    );
    yield r'address';
    yield object.address == null
        ? null
        : serializers.serialize(
            object.address,
            specifiedType: const FullType.nullable(String),
          );
    yield r'phone';
    yield object.phone == null
        ? null
        : serializers.serialize(
            object.phone,
            specifiedType: const FullType.nullable(String),
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
    DumpDto object, {
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
    required DumpDtoBuilder result,
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
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.type = valueDes;
          break;
        case r'reportLong':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.reportLong = valueDes;
          break;
        case r'reportLat':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.reportLat = valueDes;
          break;
        case r'address':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.address = valueDes;
          break;
        case r'phone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
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
  DumpDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DumpDtoBuilder();
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
