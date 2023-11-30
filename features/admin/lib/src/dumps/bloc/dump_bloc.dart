import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:data/data.dart';

part 'dump_event.dart';

part 'dump_state.dart';

class DumpBloc extends Bloc<DumpEvent, DumpState> {
  DumpBloc() : super(LoadingState()) {
    on<LoadData>(_onLoadData);
    on<UpdateDump>(_onUpdateDump);
    on<ReloadPage>(_onReloadEvent);
    add(LoadData());
  }

  Future<void> _onLoadData(
    LoadData _,
    Emitter<DumpState> emit,
  ) async {
    try {
      emit(
        LoadingState(),
      );

      final List<ReportModel> dumpReports = [];
      emit(
        ContentState(
          dumpReports: dumpReports,
        ),
      );
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Something went wrong'),
      );
    }
  }

  Future<void> _onUpdateDump(
    UpdateDump event,
    Emitter<DumpState> emit,
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

      await apiProvider.updateDumpReport(
          id: event.id,
          name: event.name,
          moreInformation: event.moreInformation,
          workingHours: event.workingHours,
          phone: event.phone,
          isVisible: event.isVisible);

      final List<ReportModel> dumpReports =
          await apiProvider.getAllDumpReports();
      emit(
        ContentState(
          dumpReports: dumpReports,
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
    Emitter<DumpState> emit,
  ) async {
    add(LoadData());
  }
}
