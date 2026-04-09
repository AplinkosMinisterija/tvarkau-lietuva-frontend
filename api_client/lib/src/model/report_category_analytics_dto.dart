//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/category_breakdown_item_dto.dart';
import 'package:api_client/src/model/resolution_performance_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/monthly_trend_item_dto.dart';
import 'package:api_client/src/model/status_distribution_item_dto.dart';
import 'package:api_client/src/model/region_breakdown_item_dto.dart';
import 'package:api_client/src/model/overall_summary_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'report_category_analytics_dto.g.dart';

/// ReportCategoryAnalyticsDto
///
/// Properties:
/// * [summary]
/// * [statusDistribution]
/// * [categoryBreakdown]
/// * [geographicBreakdown]
/// * [monthlyTrends]
/// * [resolutionPerformance]
/// * [generatedAt] - ISO timestamp of when analytics were computed
@BuiltValue()
abstract class ReportCategoryAnalyticsDto
    implements
        Built<ReportCategoryAnalyticsDto, ReportCategoryAnalyticsDtoBuilder> {
  @BuiltValueField(wireName: r'summary')
  OverallSummaryDto get summary;

  @BuiltValueField(wireName: r'statusDistribution')
  BuiltList<StatusDistributionItemDto> get statusDistribution;

  @BuiltValueField(wireName: r'categoryBreakdown')
  BuiltList<CategoryBreakdownItemDto> get categoryBreakdown;

  @BuiltValueField(wireName: r'geographicBreakdown')
  BuiltList<RegionBreakdownItemDto> get geographicBreakdown;

  @BuiltValueField(wireName: r'monthlyTrends')
  BuiltList<MonthlyTrendItemDto> get monthlyTrends;

  @BuiltValueField(wireName: r'resolutionPerformance')
  ResolutionPerformanceDto get resolutionPerformance;

  /// ISO timestamp of when analytics were computed
  @BuiltValueField(wireName: r'generatedAt')
  String get generatedAt;

  ReportCategoryAnalyticsDto._();

  factory ReportCategoryAnalyticsDto(
          [void updates(ReportCategoryAnalyticsDtoBuilder b)]) =
      _$ReportCategoryAnalyticsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReportCategoryAnalyticsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReportCategoryAnalyticsDto> get serializer =>
      _$ReportCategoryAnalyticsDtoSerializer();
}

class _$ReportCategoryAnalyticsDtoSerializer
    implements PrimitiveSerializer<ReportCategoryAnalyticsDto> {
  @override
  final Iterable<Type> types = const [
    ReportCategoryAnalyticsDto,
    _$ReportCategoryAnalyticsDto
  ];

  @override
  final String wireName = r'ReportCategoryAnalyticsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReportCategoryAnalyticsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'summary';
    yield serializers.serialize(
      object.summary,
      specifiedType: const FullType(OverallSummaryDto),
    );
    yield r'statusDistribution';
    yield serializers.serialize(
      object.statusDistribution,
      specifiedType:
          const FullType(BuiltList, [FullType(StatusDistributionItemDto)]),
    );
    yield r'categoryBreakdown';
    yield serializers.serialize(
      object.categoryBreakdown,
      specifiedType:
          const FullType(BuiltList, [FullType(CategoryBreakdownItemDto)]),
    );
    yield r'geographicBreakdown';
    yield serializers.serialize(
      object.geographicBreakdown,
      specifiedType:
          const FullType(BuiltList, [FullType(RegionBreakdownItemDto)]),
    );
    yield r'monthlyTrends';
    yield serializers.serialize(
      object.monthlyTrends,
      specifiedType: const FullType(BuiltList, [FullType(MonthlyTrendItemDto)]),
    );
    yield r'resolutionPerformance';
    yield serializers.serialize(
      object.resolutionPerformance,
      specifiedType: const FullType(ResolutionPerformanceDto),
    );
    yield r'generatedAt';
    yield serializers.serialize(
      object.generatedAt,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ReportCategoryAnalyticsDto object, {
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
    required ReportCategoryAnalyticsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(OverallSummaryDto),
          ) as OverallSummaryDto;
          result.summary.replace(valueDes);
          break;
        case r'statusDistribution':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(
                BuiltList, [FullType(StatusDistributionItemDto)]),
          ) as BuiltList<StatusDistributionItemDto>;
          result.statusDistribution.replace(valueDes);
          break;
        case r'categoryBreakdown':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(CategoryBreakdownItemDto)]),
          ) as BuiltList<CategoryBreakdownItemDto>;
          result.categoryBreakdown.replace(valueDes);
          break;
        case r'geographicBreakdown':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(RegionBreakdownItemDto)]),
          ) as BuiltList<RegionBreakdownItemDto>;
          result.geographicBreakdown.replace(valueDes);
          break;
        case r'monthlyTrends':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(MonthlyTrendItemDto)]),
          ) as BuiltList<MonthlyTrendItemDto>;
          result.monthlyTrends.replace(valueDes);
          break;
        case r'resolutionPerformance':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ResolutionPerformanceDto),
          ) as ResolutionPerformanceDto;
          result.resolutionPerformance.replace(valueDes);
          break;
        case r'generatedAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.generatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReportCategoryAnalyticsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReportCategoryAnalyticsDtoBuilder();
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
