// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportEntity _$ReportEntityFromJson(Map<String, dynamic> json) => ReportEntity(
      refId: json['refId'] as String?,
      isDeleted: json['isDeleted'] as bool? ?? false,
      historyData: (json['historyData'] as List<dynamic>?)
          ?.map((e) => HistoryEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['_id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      reportLong: (json['reportLong'] as num).toDouble(),
      reportLat: (json['reportLat'] as num).toDouble(),
      status: json['status'] as String,
      isVisible: json['isVisible'] as bool? ?? false,
      email: json['email'] as String? ?? '-',
      phone: json['phone'] as String? ?? '',
      address: json['address'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
      workingHours: json['workingHours'] as String? ?? '',
      moreInformation: json['moreInformation'] as String? ?? '',
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      reportDate: json['reportDate'] as String? ?? '',
      statusRecords: (json['statusRecords'] as List<dynamic>?)
          ?.map((e) => RecordsEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReportEntityToJson(ReportEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'refId': instance.refId,
      'name': instance.name,
      'type': instance.type,
      'reportLong': instance.reportLong,
      'reportLat': instance.reportLat,
      'status': instance.status,
      'phone': instance.phone,
      'comment': instance.comment,
      'email': instance.email,
      'address': instance.address,
      'workingHours': instance.workingHours,
      'moreInformation': instance.moreInformation,
      'reportDate': instance.reportDate,
      'isVisible': instance.isVisible,
      'isDeleted': instance.isDeleted,
      'imageUrls': instance.imageUrls,
      'historyData': instance.historyData,
      'statusRecords': instance.statusRecords,
    };

EditEntity _$EditEntityFromJson(Map<String, dynamic> json) => EditEntity(
      field: json['field'] as String? ?? '',
      change: json['change'] as String? ?? '',
    );

Map<String, dynamic> _$EditEntityToJson(EditEntity instance) =>
    <String, dynamic>{
      'field': instance.field,
      'change': instance.change,
    };

HistoryEntity _$HistoryEntityFromJson(Map<String, dynamic> json) =>
    HistoryEntity(
      user: json['user'] as String? ?? '',
      date: json['date'] as String? ?? '',
      edits: (json['edits'] as List<dynamic>?)
              ?.map((e) => EditEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$HistoryEntityToJson(HistoryEntity instance) =>
    <String, dynamic>{
      'user': instance.user,
      'date': instance.date,
      'edits': instance.edits,
    };

Map<String, dynamic> _$CreateReportRequestToJson(
        CreateReportRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'reportLong': instance.reportLong,
      'reportLat': instance.reportLat,
      'reportDate': instance.reportDate,
      'imageUrl': instance.imageUrl,
      'status': instance.status,
    };

RecordsEntity _$RecordsEntityFromJson(Map<String, dynamic> json) =>
    RecordsEntity(
      status: json['status'] as String? ?? '',
      date: json['date'] as String? ?? '',
    );

Map<String, dynamic> _$RecordsEntityToJson(RecordsEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'date': instance.date,
    };
