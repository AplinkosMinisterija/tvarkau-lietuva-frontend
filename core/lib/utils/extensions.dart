import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

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

  LatLng get latLng => LatLng(latitude, longitude);

  String get mapIconPath {
    return switch (status) {
      'gautas' => 'assets/icons/marker_pins/red_marker.png',
      'tiriamas' => 'assets/icons/marker_pins/orange_marker.png',
      'nepasitvirtino' => 'assets/icons/marker_pins/gray_marker.png',
      'sutvarkyta' => 'assets/icons/marker_pins/green_marker.png',
      _ => 'assets/icons/marker_pins/red_marker.png',
    };
  }
}
