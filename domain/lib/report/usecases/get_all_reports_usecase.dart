part of report_library;

class GetAllReportsUseCase
    extends FutureUseCase<List<ReportModel>, NoPayload> {
  final ReportRepository _reportRepository;

  GetAllReportsUseCase({
    required ReportRepository reportRepository,
  }) : _reportRepository = reportRepository;

  @override
  Future<List<ReportModel>> execute(NoPayload payload) {
    return _reportRepository.getAllReports();
  }
}
