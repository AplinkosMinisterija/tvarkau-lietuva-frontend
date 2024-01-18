import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MarkerIconFactory {
  static const reportIconPath = 'assets/svg/pin_icon.svg';
  static const dumpIconPath = 'assets/svg/dump_icon.svg';

  static Widget fromFullReport(FullReportDto fullReport) {
    return SvgPicture.asset(
      reportIconPath,
      key: Key('report-icon-${fullReport.status}'),
      excludeFromSemantics: true,
      theme: SvgTheme(currentColor: _getColorByReportStatus(fullReport.status)),
    );
  }

  static Widget fromPublicReportDto(PublicReportDto report) {
    return SvgPicture.asset(
      reportIconPath,
      key: Key('report-icon-${report.status}'),
      excludeFromSemantics: true,
      theme: SvgTheme(currentColor: _getColorByReportStatus(report.status)),
    );
  }

  static Widget reportDefault() {
    return SvgPicture.asset(
      reportIconPath,
      key: const Key('report-icon-default'),
      excludeFromSemantics: true,
      theme: const SvgTheme(currentColor: Color(0xff2a6354)),
    );
  }

  static Widget dump() {
    return SvgPicture.asset(
      dumpIconPath,
      key: const Key('dump-icon'),
      excludeFromSemantics: true,
    );
  }

  static Color _getColorByReportStatus(final String status) {
    return switch (status) {
      'gautas' => Colors.red,
      'tiriamas' => Colors.orange,
      'nepasitvirtino' => Colors.grey,
      'sutvarkyta' => Colors.green,
      'ištirtas' => Colors.blue,
      _ => Colors.black,
    };
  }
}
