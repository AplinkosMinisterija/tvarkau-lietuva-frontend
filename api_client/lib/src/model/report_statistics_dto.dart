//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'report_statistics_dto.g.dart';

/// ReportStatisticsDto
///
/// Properties:
/// * [totalSentReports]
/// * [totalInInvestigationReports]
/// * [totalInvestigatedReports]
/// * [totalFalseReports]
@BuiltValue()
abstract class ReportStatisticsDto
    implements Built<ReportStatisticsDto, ReportStatisticsDtoBuilder> {
  @BuiltValueField(wireName: r'totalSentReports')
  int get totalSentReports;

  @BuiltValueField(wireName: r'totalInInvestigationReports')
  int get totalInInvestigationReports;

  @BuiltValueField(wireName: r'totalInvestigatedReports')
  int get totalInvestigatedReports;

  @BuiltValueField(wireName: r'totalFalseReports')
  int get totalFalseReports;

  ReportStatisticsDto._();

  factory ReportStatisticsDto([void updates(ReportStatisticsDtoBuilder b)]) =
      _$ReportStatisticsDto;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReportStatisticsDtoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReportStatisticsDto> get serializer =>
      _$ReportStatisticsDtoSerializer();
}

class _$ReportStatisticsDtoSerializer
    implements PrimitiveSerializer<ReportStatisticsDto> {
  @override
  final Iterable<Type> types = const [
    ReportStatisticsDto,
    _$ReportStatisticsDto
  ];

  @override
  final String wireName = r'ReportStatisticsDto';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReportStatisticsDto object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'totalSentReports';
    yield serializers.serialize(
      object.totalSentReports,
      specifiedType: const FullType(int),
    );
    yield r'totalInInvestigationReports';
    yield serializers.serialize(
      object.totalInInvestigationReports,
      specifiedType: const FullType(int),
    );
    yield r'totalInvestigatedReports';
    yield serializers.serialize(
      object.totalInvestigatedReports,
      specifiedType: const FullType(int),
    );
    yield r'totalFalseReports';
    yield serializers.serialize(
      object.totalFalseReports,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ReportStatisticsDto object, {
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
    required ReportStatisticsDtoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'totalSentReports':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalSentReports = valueDes;
          break;
        case r'totalInInvestigationReports':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalInInvestigationReports = valueDes;
          break;
        case r'totalInvestigatedReports':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalInvestigatedReports = valueDes;
          break;
        case r'totalFalseReports':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalFalseReports = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReportStatisticsDto deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReportStatisticsDtoBuilder();
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
