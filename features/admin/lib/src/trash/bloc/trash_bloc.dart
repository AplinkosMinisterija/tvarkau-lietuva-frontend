import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:dio/dio.dart' as dio;

part 'trash_event.dart';

part 'trash_state.dart';

class TrashBloc extends Bloc<TrashEvent, TrashState> {
  TrashBloc() : super(LoadingState()) {
    on<LoadData>(_onLoadData);
    on<UpdateReport>(_onUpdateReport);
    on<ReloadPage>(_onReloadEvent);
    add(LoadData());
  }

  Future<void> _onLoadData(
    LoadData _,
    Emitter<TrashState> emit,
  ) async {
    try {
      emit(
        LoadingState(),
      );

      final List<FullReportDto> trashReports =
          await ApiProvider().getAllTrashReports();
      if (trashReports.isNotEmpty) {
        emit(
          ContentState(
            trashReports: trashReports,
          ),
        );
      } else {
        emit(ErrorState(errorMessage: 'Klaida'));
      }
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Something went wrong'),
      );
    }
  }

  Future<void> _onUpdateReport(
    UpdateReport event,
    Emitter<TrashState> emit,
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
          await ApiProvider().getAllTrashReports();
      if (trashReports.isNotEmpty) {

        emit(
          ContentState(
            trashReports: trashReports,
          ),
        );
      } else {
        emit(ErrorState(errorMessage: 'Klaida'));
      }
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Įvyko netikėta klaida'),
      );
    }
  }

  Future<void> _onReloadEvent(
    ReloadPage _,
    Emitter<TrashState> emit,
  ) async {
    add(LoadData());
  }
}
