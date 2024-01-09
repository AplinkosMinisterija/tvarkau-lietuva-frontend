import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:data/data.dart';

part 'information_event.dart';

part 'information_state.dart';

class InformationBloc extends Bloc<InformationEvent, InformationState> {
  final String refId;

  InformationBloc({
    required this.refId,
  }) : super(LoadingState()) {
    on<LoadData>(_onLoadData);
    on<ReloadPage>(_onReloadEvent);
    add(LoadData(refId: refId));
  }

  Future<void> _onLoadData(
    LoadData event,
    Emitter<InformationState> emit,
  ) async {
    try {

      final PublicReportDto trashReport = await ApiProvider().getOneTrashReport(
        event.refId,
      );
      emit(
        ContentState(
          trashReport: trashReport,
        ),
      );
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Netikėta klaida'),
      );
    }
  }

  Future<void> _onReloadEvent(
    ReloadPage _,
    Emitter<InformationState> emit,
  ) async {
    add(LoadData(refId: refId));
  }
}
