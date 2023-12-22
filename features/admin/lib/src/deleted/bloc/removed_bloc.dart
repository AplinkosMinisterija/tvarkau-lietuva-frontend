import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:dio/dio.dart' as dio;

part 'removed_event.dart';

part 'removed_state.dart';

class RemovedBloc extends Bloc<RemovedEvent, RemovedState> {
  RemovedBloc() : super(LoadingState()) {
    on<LoadData>(_onLoadData);
    on<UpdateReport>(_onUpdateReport);
    on<ReloadPage>(_onReloadEvent);
    add(LoadData());
  }

  Future<void> _onLoadData(
    LoadData _,
    Emitter<RemovedState> emit,
  ) async {
    try {
      emit(
        LoadingState(),
      );

      final List<FullReportDto> trashReports =
          await ApiProvider().getAllRemovedReports();
      emit(
        ContentState(
          trashReports: trashReports,
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
    Emitter<RemovedState> emit,
  ) async {
    try {
      emit(
        LoadingState(),
      );

      await ApiProvider().updateTrashReport(
        id: event.id,
        refId: event.refId,
        name: event.name,
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

      final List<FullReportDto> trashReports =
          await ApiProvider().getAllRemovedReports();
      emit(
        ContentState(
          trashReports: trashReports,
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
    Emitter<RemovedState> emit,
  ) async {
    add(LoadData());
  }
}
