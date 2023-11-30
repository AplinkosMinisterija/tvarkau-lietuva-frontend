import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:data/data.dart';
import 'package:http/http.dart' as https;

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
      final ApiProviderBase apiProviderBase = ApiProviderBase(
        baseUrl: HttpApiConstants.devBaseUrl,
      );
      final ApiProvider apiProvider = ApiProvider(
        apiProviderBase: apiProviderBase,
      );
      final List<ReportModel>? trashReports =
          await apiProvider.getAllTrashReports();
      if (trashReports != null) {
        emit(
          ContentState(
            trashReports: trashReports,
          ),
        );
      } else {
        emit(ErrorState(errorMessage: 'Neautorizuota'));
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
      final ApiProviderBase apiProviderBase = ApiProviderBase(
        baseUrl: HttpApiConstants.devBaseUrl,
      );
      final ApiProvider apiProvider = ApiProvider(
        apiProviderBase: apiProviderBase,
      );

      await apiProvider.updateTrashReport(
        id: event.id,
        name: event.name,
        editor: event.editor,
        reportLong: event.reportLong,
        reportLat: event.reportLat,
        status: event.status,
        comment: event.comment,
        isVisible: event.isVisible,
        isDeleted: event.isDeleted,
        officerImageFiles: event.officerImageFiles,
      );

      final List<ReportModel>? trashReports =
          await apiProvider.getAllTrashReports();
      if (trashReports != null) {
        emit(
          ContentState(
            trashReports: trashReports,
          ),
        );
      } else {
        emit(ErrorState(errorMessage: 'Neautorizuota'));
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
