//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'status_records_dto.g.dart';

/// StatusRecordsDto
///
/// Properties:
/// * [status]
/// * [date]
@BuiltValue()
abstract class StatusRecordsDto
    implements Built<StatusRecordsDto, StatusRecordsDtoBuilder> {
  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'date')
  DateTime get date;

  StatusRecordsDto._();

  factory StatusRecordsDto([void updates(StatusRecordsDtoBuilder b)]) =
      _$StatusRecordsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StatusRecordsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StatusRecordsDto> get serializer =>
      _$StatusRecordsDtoSerializer();
}

class _$StatusRecordsDtoSerializer
    implements PrimitiveSerializer<StatusRecordsDto> {
  @override
  final Iterable<Type> types = const [StatusRecordsDto, _$StatusRecordsDto];

  @override
  final String wireName = r'StatusRecordsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StatusRecordsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    yield r'date';
    yield serializers.serialize(
      object.date,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    StatusRecordsDto object, {
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
    required StatusRecordsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.status = valueDes;
          break;
        case r'date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.date = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StatusRecordsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StatusRecordsDtoBuilder();
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
