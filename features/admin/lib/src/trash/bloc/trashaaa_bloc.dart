import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:dio/dio.dart' as dio;

part 'trashaaa_event.dart';

part 'trashaaa_state.dart';

class TrashBlocaaa extends Bloc<TrashEventaaa, TrashStateaaa> {
  TrashBlocaaa() : super(LoadingState()) {
    on<LoadData>(_onLoadData);
    on<UpdateReport>(_onUpdateReport);
    on<ReloadPage>(_onReloadEvent);
    add(LoadData());
  }

  Future<void> _onLoadData(
    LoadData _,
    Emitter<TrashStateaaa> emit,
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
    Emitter<TrashStateaaa> emit,
  ) async {
    try {
      emit(
        LoadingState(),
      );

      // await ApiProvider().updateTrashReport(
      //   id: event.id,
      //   refId: event.refId,
      //   name: event.name,
      //   reportLong: event.reportLong,
      //   reportLat: event.reportLat,
      //   status: event.status,
      //   comment: event.comment,
      //   isVisible: event.isVisible,
      //   isDeleted: event.isDeleted,
      //   officerImageFiles: event.officerImageFiles,
      //   officerImageUrls: event.officerImageUrls,
      //   imageUrls: event.imageUrls,
      // );

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
    Emitter<TrashStateaaa> emit,
  ) async {
    add(LoadData());
  }
}
