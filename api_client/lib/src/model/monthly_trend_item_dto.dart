//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'monthly_trend_item_dto.g.dart';

/// MonthlyTrendItemDto
///
/// Properties:
/// * [period]
/// * [year]
/// * [month]
/// * [count]
/// * [resolved]
/// * [avgResolutionHours]
/// * [countChangePercent]
/// * [resolvedChangePercent]
/// * [resolutionTimeChangePercent]
@BuiltValue()
abstract class MonthlyTrendItemDto
    implements Built<MonthlyTrendItemDto, MonthlyTrendItemDtoBuilder> {
  @BuiltValueField(wireName: r'period')
  String get period;

  @BuiltValueField(wireName: r'year')
  num get year;

  @BuiltValueField(wireName: r'month')
  num get month;

  @BuiltValueField(wireName: r'count')
  num get count;

  @BuiltValueField(wireName: r'resolved')
  num get resolved;

  @BuiltValueField(wireName: r'avgResolutionHours')
  num get avgResolutionHours;

  @BuiltValueField(wireName: r'countChangePercent')
  num? get countChangePercent;

  @BuiltValueField(wireName: r'resolvedChangePercent')
  num? get resolvedChangePercent;

  @BuiltValueField(wireName: r'resolutionTimeChangePercent')
  num? get resolutionTimeChangePercent;

  MonthlyTrendItemDto._();

  factory MonthlyTrendItemDto([void updates(MonthlyTrendItemDtoBuilder b)]) =
      _$MonthlyTrendItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MonthlyTrendItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MonthlyTrendItemDto> get serializer =>
      _$MonthlyTrendItemDtoSerializer();
}

class _$MonthlyTrendItemDtoSerializer
    implements PrimitiveSerializer<MonthlyTrendItemDto> {
  @override
  final Iterable<Type> types = const [
    MonthlyTrendItemDto,
    _$MonthlyTrendItemDto
  ];

  @override
  final String wireName = r'MonthlyTrendItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MonthlyTrendItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'period';
    yield serializers.serialize(
      object.period,
      specifiedType: const FullType(String),
    );
    yield r'year';
    yield serializers.serialize(
      object.year,
      specifiedType: const FullType(num),
    );
    yield r'month';
    yield serializers.serialize(
      object.month,
      specifiedType: const FullType(num),
    );
    yield r'count';
    yield serializers.serialize(
      object.count,
      specifiedType: const FullType(num),
    );
    yield r'resolved';
    yield serializers.serialize(
      object.resolved,
      specifiedType: const FullType(num),
    );
    yield r'avgResolutionHours';
    yield serializers.serialize(
      object.avgResolutionHours,
      specifiedType: const FullType(num),
    );
    if (object.countChangePercent != null) {
      yield r'countChangePercent';
      yield serializers.serialize(
        object.countChangePercent,
        specifiedType: const FullType(num),
      );
    }
    if (object.resolvedChangePercent != null) {
      yield r'resolvedChangePercent';
      yield serializers.serialize(
        object.resolvedChangePercent,
        specifiedType: const FullType(num),
      );
    }
    if (object.resolutionTimeChangePercent != null) {
      yield r'resolutionTimeChangePercent';
      yield serializers.serialize(
        object.resolutionTimeChangePercent,
        specifiedType: const FullType(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MonthlyTrendItemDto object, {
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
    required MonthlyTrendItemDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'period':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.period = valueDes;
          break;
        case r'year':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.year = valueDes;
          break;
        case r'month':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.month = valueDes;
          break;
        case r'count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.count = valueDes;
          break;
        case r'resolved':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.resolved = valueDes;
          break;
        case r'avgResolutionHours':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.avgResolutionHours = valueDes;
          break;
        case r'countChangePercent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.countChangePercent = valueDes;
          break;
        case r'resolvedChangePercent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.resolvedChangePercent = valueDes;
          break;
        case r'resolutionTimeChangePercent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.resolutionTimeChangePercent = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MonthlyTrendItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MonthlyTrendItemDtoBuilder();
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
