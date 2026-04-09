//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'status_distribution_item_dto.g.dart';

/// StatusDistributionItemDto
///
/// Properties:
/// * [status]
/// * [count]
/// * [percentage]
@BuiltValue()
abstract class StatusDistributionItemDto
    implements
        Built<StatusDistributionItemDto, StatusDistributionItemDtoBuilder> {
  @BuiltValueField(wireName: r'status')
  String get status;

  @BuiltValueField(wireName: r'count')
  num get count;

  @BuiltValueField(wireName: r'percentage')
  num get percentage;

  StatusDistributionItemDto._();

  factory StatusDistributionItemDto(
          [void updates(StatusDistributionItemDtoBuilder b)]) =
      _$StatusDistributionItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StatusDistributionItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StatusDistributionItemDto> get serializer =>
      _$StatusDistributionItemDtoSerializer();
}

class _$StatusDistributionItemDtoSerializer
    implements PrimitiveSerializer<StatusDistributionItemDto> {
  @override
  final Iterable<Type> types = const [
    StatusDistributionItemDto,
    _$StatusDistributionItemDto
  ];

  @override
  final String wireName = r'StatusDistributionItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StatusDistributionItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(String),
    );
    yield r'count';
    yield serializers.serialize(
      object.count,
      specifiedType: const FullType(num),
    );
    yield r'percentage';
    yield serializers.serialize(
      object.percentage,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    StatusDistributionItemDto object, {
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
    required StatusDistributionItemDtoBuilder result,
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
        case r'count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.count = valueDes;
          break;
        case r'percentage':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.percentage = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  StatusDistributionItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StatusDistributionItemDtoBuilder();
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
