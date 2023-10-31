part of report_library;

abstract class ReportRepository {
  Future<List<ReportModel>> getAllReports();
}
