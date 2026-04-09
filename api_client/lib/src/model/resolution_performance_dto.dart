//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/sla_performance_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'resolution_performance_dto.g.dart';

/// ResolutionPerformanceDto
///
/// Properties:
/// * [avgResolutionHours]
/// * [medianResolutionHours]
/// * [minResolutionHours]
/// * [maxResolutionHours]
/// * [sla]
/// * [resolvedCount] - Resolved report count used for calculation
@BuiltValue()
abstract class ResolutionPerformanceDto
    implements
        Built<ResolutionPerformanceDto, ResolutionPerformanceDtoBuilder> {
  @BuiltValueField(wireName: r'avgResolutionHours')
  num get avgResolutionHours;

  @BuiltValueField(wireName: r'medianResolutionHours')
  num get medianResolutionHours;

  @BuiltValueField(wireName: r'minResolutionHours')
  num get minResolutionHours;

  @BuiltValueField(wireName: r'maxResolutionHours')
  num get maxResolutionHours;

  @BuiltValueField(wireName: r'sla')
  SlaPerformanceDto get sla;

  /// Resolved report count used for calculation
  @BuiltValueField(wireName: r'resolvedCount')
  num get resolvedCount;

  ResolutionPerformanceDto._();

  factory ResolutionPerformanceDto(
          [void updates(ResolutionPerformanceDtoBuilder b)]) =
      _$ResolutionPerformanceDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ResolutionPerformanceDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ResolutionPerformanceDto> get serializer =>
      _$ResolutionPerformanceDtoSerializer();
}

class _$ResolutionPerformanceDtoSerializer
    implements PrimitiveSerializer<ResolutionPerformanceDto> {
  @override
  final Iterable<Type> types = const [
    ResolutionPerformanceDto,
    _$ResolutionPerformanceDto
  ];

  @override
  final String wireName = r'ResolutionPerformanceDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ResolutionPerformanceDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'avgResolutionHours';
    yield serializers.serialize(
      object.avgResolutionHours,
      specifiedType: const FullType(num),
    );
    yield r'medianResolutionHours';
    yield serializers.serialize(
      object.medianResolutionHours,
      specifiedType: const FullType(num),
    );
    yield r'minResolutionHours';
    yield serializers.serialize(
      object.minResolutionHours,
      specifiedType: const FullType(num),
    );
    yield r'maxResolutionHours';
    yield serializers.serialize(
      object.maxResolutionHours,
      specifiedType: const FullType(num),
    );
    yield r'sla';
    yield serializers.serialize(
      object.sla,
      specifiedType: const FullType(SlaPerformanceDto),
    );
    yield r'resolvedCount';
    yield serializers.serialize(
      object.resolvedCount,
      specifiedType: const FullType(num),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ResolutionPerformanceDto object, {
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
    required ResolutionPerformanceDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'avgResolutionHours':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.avgResolutionHours = valueDes;
          break;
        case r'medianResolutionHours':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.medianResolutionHours = valueDes;
          break;
        case r'minResolutionHours':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.minResolutionHours = valueDes;
          break;
        case r'maxResolutionHours':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.maxResolutionHours = valueDes;
          break;
        case r'sla':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SlaPerformanceDto),
          ) as SlaPerformanceDto;
          result.sla.replace(valueDes);
          break;
        case r'resolvedCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.resolvedCount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ResolutionPerformanceDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResolutionPerformanceDtoBuilder();
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
