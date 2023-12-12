//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/history_edits_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'history_data_dto.g.dart';

/// HistoryDataDto
///
/// Properties:
/// * [user]
/// * [date]
/// * [edits]
@BuiltValue()
abstract class HistoryDataDto
    implements Built<HistoryDataDto, HistoryDataDtoBuilder> {
  @BuiltValueField(wireName: r'user')
  String get user;

  @BuiltValueField(wireName: r'date')
  DateTime get date;

  @BuiltValueField(wireName: r'edits')
  BuiltList<HistoryEditsDto> get edits;

  HistoryDataDto._();

  factory HistoryDataDto([void updates(HistoryDataDtoBuilder b)]) =
      _$HistoryDataDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(HistoryDataDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<HistoryDataDto> get serializer =>
      _$HistoryDataDtoSerializer();
}

class _$HistoryDataDtoSerializer
    implements PrimitiveSerializer<HistoryDataDto> {
  @override
  final Iterable<Type> types = const [HistoryDataDto, _$HistoryDataDto];

  @override
  final String wireName = r'HistoryDataDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    HistoryDataDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'user';
    yield serializers.serialize(
      object.user,
      specifiedType: const FullType(String),
    );
    yield r'date';
    yield serializers.serialize(
      object.date,
      specifiedType: const FullType(DateTime),
    );
    yield r'edits';
    yield serializers.serialize(
      object.edits,
      specifiedType: const FullType(BuiltList, [FullType(HistoryEditsDto)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    HistoryDataDto object, {
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
    required HistoryDataDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'user':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.user = valueDes;
          break;
        case r'date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.date = valueDes;
          break;
        case r'edits':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(HistoryEditsDto)]),
          ) as BuiltList<HistoryEditsDto>;
          result.edits.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  HistoryDataDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = HistoryDataDtoBuilder();
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
