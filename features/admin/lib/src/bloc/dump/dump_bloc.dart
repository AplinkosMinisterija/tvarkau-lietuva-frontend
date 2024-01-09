import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:api_client/api_client.dart';

part 'dump_event.dart';

part 'dump_state.dart';

class DumpBloc extends Bloc<DumpEvent, DumpState> {
  final String refId;

  DumpBloc({
    required this.refId,
  }) : super(LoadingState()) {
    on<LoadData>(_onLoadData);
    on<UpdateDump>(_onUpdateDump);
    on<ReloadPage>(_onReloadEvent);
    add(LoadData(refId: refId));
  }

  Future<void> _onLoadData(
    LoadData event,
    Emitter<DumpState> emit,
  ) async {
    try {
      emit(
        LoadingState(),
      );
      final FullDumpDto dumpReport =
          await ApiProvider().getFullDumpReportById(event.refId);
      emit(
        ContentState(
          dumpReport: dumpReport,
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

      await ApiProvider().updateDumpReport(
        id: event.id,
        name: event.name,
        moreInformation: event.moreInformation,
        workingHours: event.workingHours,
        phone: event.phone,
        isVisible: event.isVisible,
        longitude: event.longitude,
        latitude: event.latitude,
        address: event.address,
      );
      final FullDumpDto dumpReport =
          await ApiProvider().getFullDumpReportById(event.id);

      emit(ContentState(dumpReport: dumpReport));
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
    add(LoadData(refId: refId));
  }
}
