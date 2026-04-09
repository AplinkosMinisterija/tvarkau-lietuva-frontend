//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sla_performance_dto.g.dart';

/// SlaPerformanceDto
///
/// Properties:
/// * [within24h] - Reports resolved within 24 h
/// * [within72h] - Reports resolved within 72 h
/// * [within7d] - Reports resolved within 7 days
/// * [within30d] - Reports resolved within 30 days
/// * [over30d] - Reports not yet resolved or over 30 days
/// * [within24hPercent]
/// * [within72hPercent]
/// * [within7dPercent]
/// * [within30dPercent]
@BuiltValue()
abstract class SlaPerformanceDto
    implements Built<SlaPerformanceDto, SlaPerformanceDtoBuilder> {
  /// Reports resolved within 24 h
  @BuiltValueField(wireName: r'within24h')
  num get within24h;

  /// Reports resolved within 72 h
  @BuiltValueField(wireName: r'within72h')
  num get within72h;

  /// Reports resolved within 7 days
  @BuiltValueField(wireName: r'within7d')
  num get within7d;

  /// Reports resolved within 30 days
  @BuiltValueField(wireName: r'within30d')
  num get within30d;

  /// Reports not yet resolved or over 30 days
  @BuiltValueField(wireName: r'over30d')
  num get over30d;

  @BuiltValueField(wireName: r'within24hPercent')
  num get within24hPercent;

  @BuiltValueField(wireName: r'within72hPercent')
  num get within72hPercent;

  @BuiltValueField(wireName: r'within7dPercent')
  num get within7dPercent;

  @BuiltValueField(wireName: r'within30dPercent')
  num get within30dPercent;

  SlaPerformanceDto._();

  factory SlaPerformanceDto([void updates(SlaPerformanceDtoBuilder b)]) =
      _$SlaPerformanceDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SlaPerformanceDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SlaPerformanceDto> get serializer =>
      _$SlaPerformanceDtoSerializer();
}

class _$SlaPerformanceDtoSerializer
    implements PrimitiveSerializer<SlaPerformanceDto> {
  @override
  final Iterable<Type> types = const [SlaPerformanceDto, _$SlaPerformanceDto];

  @override
  final String wireName = r'SlaPerformanceDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SlaPerformanceDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'within24h';
    yield serializers.serialize(
      object.within24h,
      specifiedType: const FullType(num),
    );
    yield r'within72h';
    yield serializers.serialize(
      object.within72h,
      specifiedType: const FullType(num),
    );
    yield r'within7d';
    yield serializers.serialize(
      object.within7d,
      specifiedType: const FullType(num),
    );
    yield r'within30d';
    yield serializers.serialize(
      object.within30d,
      specifiedType: const FullType(num),
    );
    yield r'over30d';
    yield serializers.serialize(
      object.over30d,
      specifiedType: const FullType(num),
    );
    yield r'within24hPercent';
    yield serializers.serialize(
      object.within24hPercent,
      specifiedType: const FullType(num),
    );
    yield r'within72hPercent';
    yield serializers.serialize(
      object.within72hPercent,
      specifiedType: const FullType(num),
    );
    yield r'within7dPercent';
    yield serializers.serialize(
      object.within7dPercent,
      specifiedType: const FullType(num),
    );
    yield r'within30dPercent';
    yield serializers.serialize(
      object.within30dPercent,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SlaPerformanceDto object, {
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
    required SlaPerformanceDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'within24h':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.within24h = valueDes;
          break;
        case r'within72h':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.within72h = valueDes;
          break;
        case r'within7d':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.within7d = valueDes;
          break;
        case r'within30d':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.within30d = valueDes;
          break;
        case r'over30d':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.over30d = valueDes;
          break;
        case r'within24hPercent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.within24hPercent = valueDes;
          break;
        case r'within72hPercent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.within72hPercent = valueDes;
          break;
        case r'within7dPercent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.within7dPercent = valueDes;
          break;
        case r'within30dPercent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.within30dPercent = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SlaPerformanceDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SlaPerformanceDtoBuilder();
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
