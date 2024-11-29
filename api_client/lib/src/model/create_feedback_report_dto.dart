//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_feedback_report_dto.g.dart';

/// CreateFeedbackReportDto
///
/// Properties:
/// * [description]
/// * [email]
@BuiltValue()
abstract class CreateFeedbackReportDto
    implements Built<CreateFeedbackReportDto, CreateFeedbackReportDtoBuilder> {
  @BuiltValueField(wireName: r'description')
  String get description;

  @BuiltValueField(wireName: r'email')
  String get email;

  CreateFeedbackReportDto._();

  factory CreateFeedbackReportDto(
          [void updates(CreateFeedbackReportDtoBuilder b)]) =
      _$CreateFeedbackReportDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateFeedbackReportDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateFeedbackReportDto> get serializer =>
      _$CreateFeedbackReportDtoSerializer();
}

class _$CreateFeedbackReportDtoSerializer
    implements PrimitiveSerializer<CreateFeedbackReportDto> {
  @override
  final Iterable<Type> types = const [
    CreateFeedbackReportDto,
    _$CreateFeedbackReportDto
  ];

  @override
  final String wireName = r'CreateFeedbackReportDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateFeedbackReportDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
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
    CreateFeedbackReportDto object, {
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
    required CreateFeedbackReportDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
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
  CreateFeedbackReportDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateFeedbackReportDtoBuilder();
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
