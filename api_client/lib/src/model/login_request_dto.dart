//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_request_dto.g.dart';

/// LoginRequestDto
///
/// Properties:
/// * [accessKey]
@BuiltValue()
abstract class LoginRequestDto
    implements Built<LoginRequestDto, LoginRequestDtoBuilder> {
  @BuiltValueField(wireName: r'accessKey')
  String get accessKey;

  LoginRequestDto._();

  factory LoginRequestDto([void updates(LoginRequestDtoBuilder b)]) =
      _$LoginRequestDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LoginRequestDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LoginRequestDto> get serializer =>
      _$LoginRequestDtoSerializer();
}

class _$LoginRequestDtoSerializer
    implements PrimitiveSerializer<LoginRequestDto> {
  @override
  final Iterable<Type> types = const [LoginRequestDto, _$LoginRequestDto];

  @override
  final String wireName = r'LoginRequestDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LoginRequestDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'accessKey';
    yield serializers.serialize(
      object.accessKey,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    LoginRequestDto object, {
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
    required LoginRequestDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'accessKey':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.accessKey = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LoginRequestDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LoginRequestDtoBuilder();
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
