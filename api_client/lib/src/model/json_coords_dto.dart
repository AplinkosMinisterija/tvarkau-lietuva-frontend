//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'json_coords_dto.g.dart';

/// JsonCoordsDto
///
/// Properties:
/// * [minLat]
/// * [maxLat]
/// * [minLong]
/// * [maxLong]
@BuiltValue()
abstract class JsonCoordsDto
    implements Built<JsonCoordsDto, JsonCoordsDtoBuilder> {
  @BuiltValueField(wireName: r'minLat')
  double get minLat;

  @BuiltValueField(wireName: r'maxLat')
  double get maxLat;

  @BuiltValueField(wireName: r'minLong')
  double get minLong;

  @BuiltValueField(wireName: r'maxLong')
  double get maxLong;

  JsonCoordsDto._();

  factory JsonCoordsDto([void updates(JsonCoordsDtoBuilder b)]) =
      _$JsonCoordsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(JsonCoordsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<JsonCoordsDto> get serializer =>
      _$JsonCoordsDtoSerializer();
}

class _$JsonCoordsDtoSerializer implements PrimitiveSerializer<JsonCoordsDto> {
  @override
  final Iterable<Type> types = const [JsonCoordsDto, _$JsonCoordsDto];

  @override
  final String wireName = r'JsonCoordsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    JsonCoordsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'minLat';
    yield serializers.serialize(
      object.minLat,
      specifiedType: const FullType(double),
    );
    yield r'maxLat';
    yield serializers.serialize(
      object.maxLat,
      specifiedType: const FullType(double),
    );
    yield r'minLong';
    yield serializers.serialize(
      object.minLong,
      specifiedType: const FullType(double),
    );
    yield r'maxLong';
    yield serializers.serialize(
      object.maxLong,
      specifiedType: const FullType(double),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    JsonCoordsDto object, {
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
    required JsonCoordsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'minLat':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.minLat = valueDes;
          break;
        case r'maxLat':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.maxLat = valueDes;
          break;
        case r'minLong':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.minLong = valueDes;
          break;
        case r'maxLong':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.maxLong = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  JsonCoordsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = JsonCoordsDtoBuilder();
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
