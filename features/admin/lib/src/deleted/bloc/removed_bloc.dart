import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:data/data.dart';
import 'package:http/http.dart' as https;

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


      final List<ReportModel> trashReports =
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
        name: event.name,
        reportLong: event.reportLong,
        reportLat: event.reportLat,
        status: event.status,
        comment: event.comment,
        isVisible: event.isVisible,
        isDeleted: event.isDeleted,
        editor: event.editor,
        officerImageFiles: event.officerImageFiles,
      );

      final List<ReportModel> trashReports =
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
