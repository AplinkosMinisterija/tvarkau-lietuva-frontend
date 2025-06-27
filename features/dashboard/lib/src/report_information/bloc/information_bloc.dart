import 'package:api_client/api_client.dart';
import 'package:core/core.dart';

part 'information_event.dart';

part 'information_state.dart';

class InformationBloc extends Bloc<InformationEvent, InformationState> {
  final String? refId;

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
      if (event.refId == null) {
        emit(
          NotFoundState(
            errorMessage: 'Pranešimas nerastas',
            descriptionMessage:
                'Jūsų ieškomas pranešimas nebuvo rastas arba nėra viešai matomas. Pasitikrinkite ar gerai įvedėte nuorodą',
          ),
        );
      }
      final PublicReportDto? trashReport =
          await ApiProvider().getOneTrashReport(
        event.refId!,
      );
      if (trashReport == null) {
        emit(
          NotFoundState(
            errorMessage: 'Pranešimas nerastas',
            descriptionMessage:
                'Jūsų ieškomas pranešimas nebuvo rastas arba nėra viešai matomas. Pasitikrinkite ar gerai įvedėte nuorodą',
          ),
        );
      } else {
        emit(
          ContentState(
            trashReport: trashReport,
          ),
        );
      }
    } catch (e) {
      emit(
        NotFoundState(
          errorMessage: 'Pranešimas nerastas',
          descriptionMessage:
              'Jūsų ieškomas pranešimas nebuvo rastas arba nėra viešai matomas. Pasitikrinkite ar gerai įvedėte nuorodą',
        ),
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
