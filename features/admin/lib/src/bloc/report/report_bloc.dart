import 'dart:typed_data';

import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:core/utils/permit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'report_event.dart';

part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final String refId;

  ReportBloc({
    required this.refId,
  }) : super(LoadingState()) {
    on<LoadData>(_onLoadData);
    on<UpdateReport>(_onUpdateReport);
    on<ReloadPage>(_onReloadEvent);
    on<TransferReport>(_onTransferReport);
    add(LoadData(refId: refId));
  }

  Future<void> _onLoadData(
    LoadData event,
    Emitter<ReportState> emit,
  ) async {
    try {
      emit(
        LoadingState(),
      );

      final FullReportDto trashReport =
          await ApiProvider().getFullTrashReportById(event.refId);
      List<Permit>? permits;
      double delta = 0.03;
      LatLng southWest =
          LatLng(trashReport.latitude - delta, trashReport.longitude - delta);
      LatLng northEast =
          LatLng(trashReport.latitude + delta, trashReport.longitude + delta);
      if (trashReport.category == FullReportDtoCategoryEnum.permits) {
        permits = await ApiProvider().getVisiblePermits(
          minLat: southWest.latitude,
          minLong: southWest.longitude,
          maxLat: northEast.latitude,
          maxLong: northEast.longitude,
        );
      }

      emit(
        ContentState(
          trashReport: trashReport,
          permits: permits,
        ),
      );
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Something went wrong'),
      );
    }
  }

  Future<void> _onUpdateReport(
    UpdateReport event,
    Emitter<ReportState> emit,
  ) async {
    try {
      emit(
        LoadingState(),
      );

      await ApiProvider().updateTrashReport(
        id: event.id,
        refId: event.refId,
        name: event.name,
        category: event.category,
        reportLong: event.reportLong,
        reportLat: event.reportLat,
        status: event.status,
        comment: event.comment,
        isVisible: event.isVisible,
        isDeleted: event.isDeleted,
        officerImageFiles: event.officerImageFiles,
        officerImageUrls: event.officerImageUrls,
        imageUrls: event.imageUrls,
      );

      final FullReportDto trashReport =
          await ApiProvider().getFullTrashReportById(event.refId);

      emit(
        ContentState(
          trashReport: trashReport,
        ),
      );
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Įvyko netikėta klaida'),
      );
    }
  }

  Future<void> _onTransferReport(
    TransferReport event,
    Emitter<ReportState> emit,
  ) async {
    try {
      emit(
        LoadingState(),
      );

      await ApiProvider().transferTrashReport(
          refId: event.refId,
          name: event.name,
          longitude: event.longitude,
          latitude: event.latitude,
          status: event.status,
          reportDate: event.reportDate,
          email: event.email);

      final FullReportDto trashReport =
          await ApiProvider().getFullTrashReportById(event.refId);

      emit(
        ContentState(
          trashReport: trashReport,
        ),
      );
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Įvyko netikėta klaida'),
      );
    }
  }

  Future<void> _onReloadEvent(
    ReloadPage _,
    Emitter<ReportState> emit,
  ) async {
    add(LoadData(refId: refId));
  }
}
