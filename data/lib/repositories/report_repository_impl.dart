import 'dart:async';

import 'package:data/entities/entities.dart';
import 'package:domain/domain.dart';
import 'package:domain/report/report_library.dart';

import '../providers/http_api_provider/api_provider.dart';

class ReportRepositoryImpl implements ReportRepository {
  final ApiProvider _apiProvider;

  late StreamController<bool> _dropNotificationStreamController;

  ReportRepositoryImpl({
    required ApiProvider apiProvider,
  }) : _apiProvider = apiProvider {
    _dropNotificationStreamController = StreamController<bool>.broadcast();
  }

  @override
  Future<List<ReportModel>?> getAllTrashReports() {
    return _apiProvider.getAllTrashReports();
  }

  @override
  Future<List<ReportModel>> getAllDumpReports() {
    return _apiProvider.getAllDumpReports();
  }

  @override
  Stream<bool> observeReportsAdding() => _dropNotificationStreamController.stream;

  @override
  Future<List<ReportModel>> getAllReports() {
    // TODO: implement getAllReports
    throw UnimplementedError();
  }
}
