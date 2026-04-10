//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'category_breakdown_item_dto.g.dart';

/// CategoryBreakdownItemDto
///
/// Properties:
/// * [category]
/// * [count]
/// * [percentage]
/// * [avgResolutionHours]
@BuiltValue()
abstract class CategoryBreakdownItemDto
    implements
        Built<CategoryBreakdownItemDto, CategoryBreakdownItemDtoBuilder> {
  @BuiltValueField(wireName: r'category')
  String get category;

  @BuiltValueField(wireName: r'count')
  num get count;

  @BuiltValueField(wireName: r'percentage')
  num get percentage;

  @BuiltValueField(wireName: r'avgResolutionHours')
  num get avgResolutionHours;

  CategoryBreakdownItemDto._();

  factory CategoryBreakdownItemDto(
          [void updates(CategoryBreakdownItemDtoBuilder b)]) =
      _$CategoryBreakdownItemDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CategoryBreakdownItemDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CategoryBreakdownItemDto> get serializer =>
      _$CategoryBreakdownItemDtoSerializer();
}

class _$CategoryBreakdownItemDtoSerializer
    implements PrimitiveSerializer<CategoryBreakdownItemDto> {
  @override
  final Iterable<Type> types = const [
    CategoryBreakdownItemDto,
    _$CategoryBreakdownItemDto
  ];

  @override
  final String wireName = r'CategoryBreakdownItemDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CategoryBreakdownItemDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'category';
    yield serializers.serialize(
      object.category,
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
  }

  @override
  Object serialize(
    Serializers serializers,
    CategoryBreakdownItemDto object, {
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
    required CategoryBreakdownItemDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'category':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.category = valueDes;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CategoryBreakdownItemDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CategoryBreakdownItemDtoBuilder();
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
