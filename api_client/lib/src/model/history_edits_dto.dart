//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'history_edits_dto.g.dart';

/// HistoryEditsDto
///
/// Properties:
/// * [field]
/// * [change]
@BuiltValue()
abstract class HistoryEditsDto
    implements Built<HistoryEditsDto, HistoryEditsDtoBuilder> {
  @BuiltValueField(wireName: r'field')
  String get field;

  @BuiltValueField(wireName: r'change')
  String get change;

  HistoryEditsDto._();

  factory HistoryEditsDto([void updates(HistoryEditsDtoBuilder b)]) =
      _$HistoryEditsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HistoryEditsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<HistoryEditsDto> get serializer =>
      _$HistoryEditsDtoSerializer();
}

class _$HistoryEditsDtoSerializer
    implements PrimitiveSerializer<HistoryEditsDto> {
  @override
  final Iterable<Type> types = const [HistoryEditsDto, _$HistoryEditsDto];

  @override
  final String wireName = r'HistoryEditsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HistoryEditsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'field';
    yield serializers.serialize(
      object.field,
      specifiedType: const FullType(String),
    );
    yield r'change';
    yield serializers.serialize(
      object.change,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    HistoryEditsDto object, {
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
    required HistoryEditsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'field':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.field = valueDes;
          break;
        case r'change':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.change = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  HistoryEditsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = HistoryEditsDtoBuilder();
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
