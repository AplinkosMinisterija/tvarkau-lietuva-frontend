//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/status_distribution_item_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'region_breakdown_item_dto.g.dart';

/// RegionBreakdownItemDto
///
/// Properties:
/// * [region]
/// * [count]
/// * [percentage]
/// * [avgResolutionHours]
/// * [statusDistribution]
@BuiltValue()
abstract class RegionBreakdownItemDto
    implements Built<RegionBreakdownItemDto, RegionBreakdownItemDtoBuilder> {
  @BuiltValueField(wireName: r'region')
  String get region;

  @BuiltValueField(wireName: r'count')
  num get count;

  @BuiltValueField(wireName: r'percentage')
  num get percentage;

  @BuiltValueField(wireName: r'avgResolutionHours')
  num get avgResolutionHours;

  @BuiltValueField(wireName: r'statusDistribution')
  BuiltList<StatusDistributionItemDto> get statusDistribution;

  RegionBreakdownItemDto._();

  factory RegionBreakdownItemDto(
          [void updates(RegionBreakdownItemDtoBuilder b)]) =
      _$RegionBreakdownItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegionBreakdownItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegionBreakdownItemDto> get serializer =>
      _$RegionBreakdownItemDtoSerializer();
}

class _$RegionBreakdownItemDtoSerializer
    implements PrimitiveSerializer<RegionBreakdownItemDto> {
  @override
  final Iterable<Type> types = const [
    RegionBreakdownItemDto,
    _$RegionBreakdownItemDto
  ];

  @override
  final String wireName = r'RegionBreakdownItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegionBreakdownItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'region';
    yield serializers.serialize(
      object.region,
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
    yield r'avgResolutionHours';
    yield serializers.serialize(
      object.avgResolutionHours,
      specifiedType: const FullType(num),
    );
    yield r'statusDistribution';
    yield serializers.serialize(
      object.statusDistribution,
      specifiedType:
          const FullType(BuiltList, [FullType(StatusDistributionItemDto)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RegionBreakdownItemDto object, {
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
    required RegionBreakdownItemDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'region':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.region = valueDes;
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
        case r'avgResolutionHours':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.avgResolutionHours = valueDes;
          break;
        case r'statusDistribution':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(StatusDistributionItemDto)]),
          ) as BuiltList<StatusDistributionItemDto>;
          result.statusDistribution.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RegionBreakdownItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegionBreakdownItemDtoBuilder();
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
