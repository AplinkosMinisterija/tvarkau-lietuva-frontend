//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:api_client/src/date_serializer.dart';
import 'package:api_client/src/model/date.dart';

import 'package:api_client/src/model/create_dump_dto.dart';
import 'package:api_client/src/model/dump_dto.dart';
import 'package:api_client/src/model/full_dump_dto.dart';
import 'package:api_client/src/model/full_report_dto.dart';
import 'package:api_client/src/model/history_data_dto.dart';
import 'package:api_client/src/model/history_edits_dto.dart';
import 'package:api_client/src/model/log_in_dto.dart';
import 'package:api_client/src/model/login_request_dto.dart';
import 'package:api_client/src/model/public_report_dto.dart';
import 'package:api_client/src/model/report_statistics_dto.dart';
import 'package:api_client/src/model/status_records_dto.dart';
import 'package:api_client/src/model/transfer_report_dto.dart';
import 'package:api_client/src/model/update_dump_dto.dart';

part 'serializers.g.dart';

@SerializersFor([
  CreateDumpDto,
  DumpDto,
  FullDumpDto,
  FullReportDto,
  HistoryDataDto,
  HistoryEditsDto,
  LogInDto,
  LoginRequestDto,
  PublicReportDto,
  ReportStatisticsDto,
  StatusRecordsDto,
  TransferReportDto,
  UpdateDumpDto,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(PublicReportDto)]),
        () => ListBuilder<PublicReportDto>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(FullDumpDto)]),
        () => ListBuilder<FullDumpDto>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(DumpDto)]),
        () => ListBuilder<DumpDto>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(String)]),
        () => ListBuilder<String>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(FullReportDto)]),
        () => ListBuilder<FullReportDto>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
