//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'overall_summary_dto.g.dart';

/// OverallSummaryDto
///
/// Properties:
/// * [totalReports]
/// * [resolvedReports]
/// * [inInvestigationReports]
/// * [receivedReports]
/// * [falseReports]
/// * [resolutionRate]
/// * [avgResolutionHours]
/// * [reportsPer30Days]
/// * [reportsLast7Days]
/// * [reportsLast30Days]
/// * [reportsLast90Days]
/// * [last30DaysChangePercent]
@BuiltValue()
abstract class OverallSummaryDto
    implements Built<OverallSummaryDto, OverallSummaryDtoBuilder> {
  @BuiltValueField(wireName: r'totalReports')
  num get totalReports;

  @BuiltValueField(wireName: r'resolvedReports')
  num get resolvedReports;

  @BuiltValueField(wireName: r'inInvestigationReports')
  num get inInvestigationReports;

  @BuiltValueField(wireName: r'receivedReports')
  num get receivedReports;

  @BuiltValueField(wireName: r'falseReports')
  num get falseReports;

  @BuiltValueField(wireName: r'resolutionRate')
  num get resolutionRate;

  @BuiltValueField(wireName: r'avgResolutionHours')
  num get avgResolutionHours;

  @BuiltValueField(wireName: r'reportsPer30Days')
  num get reportsPer30Days;

  @BuiltValueField(wireName: r'reportsLast7Days')
  num get reportsLast7Days;

  @BuiltValueField(wireName: r'reportsLast30Days')
  num get reportsLast30Days;

  @BuiltValueField(wireName: r'reportsLast90Days')
  num get reportsLast90Days;

  @BuiltValueField(wireName: r'last30DaysChangePercent')
  num? get last30DaysChangePercent;

  OverallSummaryDto._();

  factory OverallSummaryDto([void updates(OverallSummaryDtoBuilder b)]) =
      _$OverallSummaryDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OverallSummaryDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OverallSummaryDto> get serializer =>
      _$OverallSummaryDtoSerializer();
}

class _$OverallSummaryDtoSerializer
    implements PrimitiveSerializer<OverallSummaryDto> {
  @override
  final Iterable<Type> types = const [OverallSummaryDto, _$OverallSummaryDto];

  @override
  final String wireName = r'OverallSummaryDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OverallSummaryDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'totalReports';
    yield serializers.serialize(
      object.totalReports,
      specifiedType: const FullType(num),
    );
    yield r'resolvedReports';
    yield serializers.serialize(
      object.resolvedReports,
      specifiedType: const FullType(num),
    );
    yield r'inInvestigationReports';
    yield serializers.serialize(
      object.inInvestigationReports,
      specifiedType: const FullType(num),
    );
    yield r'receivedReports';
    yield serializers.serialize(
      object.receivedReports,
      specifiedType: const FullType(num),
    );
    yield r'falseReports';
    yield serializers.serialize(
      object.falseReports,
      specifiedType: const FullType(num),
    );
    yield r'resolutionRate';
    yield serializers.serialize(
      object.resolutionRate,
      specifiedType: const FullType(num),
    );
    yield r'avgResolutionHours';
    yield serializers.serialize(
      object.avgResolutionHours,
      specifiedType: const FullType(num),
    );
    yield r'reportsPer30Days';
    yield serializers.serialize(
      object.reportsPer30Days,
      specifiedType: const FullType(num),
    );
    yield r'reportsLast7Days';
    yield serializers.serialize(
      object.reportsLast7Days,
      specifiedType: const FullType(num),
    );
    yield r'reportsLast30Days';
    yield serializers.serialize(
      object.reportsLast30Days,
      specifiedType: const FullType(num),
    );
    yield r'reportsLast90Days';
    yield serializers.serialize(
      object.reportsLast90Days,
      specifiedType: const FullType(num),
    );
    if (object.last30DaysChangePercent != null) {
      yield r'last30DaysChangePercent';
      yield serializers.serialize(
        object.last30DaysChangePercent,
        specifiedType: const FullType(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    OverallSummaryDto object, {
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
    required OverallSummaryDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'totalReports':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.totalReports = valueDes;
          break;
        case r'resolvedReports':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.resolvedReports = valueDes;
          break;
        case r'inInvestigationReports':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.inInvestigationReports = valueDes;
          break;
        case r'receivedReports':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.receivedReports = valueDes;
          break;
        case r'falseReports':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.falseReports = valueDes;
          break;
        case r'resolutionRate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.resolutionRate = valueDes;
          break;
        case r'avgResolutionHours':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.avgResolutionHours = valueDes;
          break;
        case r'reportsPer30Days':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.reportsPer30Days = valueDes;
          break;
        case r'reportsLast7Days':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.reportsLast7Days = valueDes;
          break;
        case r'reportsLast30Days':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.reportsLast30Days = valueDes;
          break;
        case r'reportsLast90Days':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.reportsLast90Days = valueDes;
          break;
        case r'last30DaysChangePercent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.last30DaysChangePercent = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OverallSummaryDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OverallSummaryDtoBuilder();
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
