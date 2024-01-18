import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';

extension IntX on int {
  Widget get heightBox => SizedBox(height: toDouble());

  Widget get widthBox => SizedBox(width: toDouble());
}

extension ReportExtensionPrivate on FullReportDto {
  String get fullRefIdPrivate =>
      'TLP-A${'0' * (8 - refId.length)}${refId.toUpperCase()}';
}

extension ReportExtensionPublic on PublicReportDto {
  String get fullRefIdPublic =>
      'TLP-A${'0' * (8 - refId.length)}${refId.toUpperCase()}';
}
