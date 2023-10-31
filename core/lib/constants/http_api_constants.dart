class HttpApiConstants {
//Api Base Path
  static const String basePath = 'https://orca-app-tasvj.ondigitalocean.app';

  static const String devBaseUrl = '$basePath/';

  static const String stageBaseUrl = '$basePath/';

  static const String prodBaseUrl = '$basePath/';

  //Microsoft
  static const String userInfoEndpoint =  'https://graph.microsoft.com/v1.0/me';

//Api endpoint path
  static const String reports = 'reports';
  static const String dumps = 'dumps';
  static const String visibleReports = 'reports/visible';
  static const String visibleDumps = 'dumps/visible';

//Full path
  static const String fullAuthUrl = '$basePath/auth';

  static const String fullRemovedReportsUrl = '$basePath/reports/removed';

  static const String fullTrashUrl = '$basePath/reports';

  static const String fullOneTrashReportUrl = '$basePath/reports/single';

  static const String fullVisibleTrashUrl = '$basePath/reports/visible';

  static const String fullTrashUpdateUrl = '$basePath/reports/update';

  static const String fullDumpUpdateUrl = '$basePath/dumps/update';
}
