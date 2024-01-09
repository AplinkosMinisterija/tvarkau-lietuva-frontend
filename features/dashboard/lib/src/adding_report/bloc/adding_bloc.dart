import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:dio/dio.dart' as dio;

part 'adding_event.dart';

part 'adding_state.dart';

class AddingBloc extends Bloc<AddingEvent, AddingState> {
  AddingBloc() : super(LoadingState()) {
    on<LoadData>(_onLoadData);
    on<AddReport>(_onAddReport);
    on<ReloadPage>(_onReloadEvent);
    add(LoadData());
  }

  Future<void> _onLoadData(
    LoadData _,
    Emitter<AddingState> emit,
  ) async {
    try {
      final List<PublicReportDto> trashReports =
          await ApiProvider().getAllVisibleTrashReports();

      emit(
        ContentState(
          trashReports: trashReports,
        ),
      );
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Netikėta klaida'),
      );
    }
  }

  Future<void> _onAddReport(
    AddReport event,
    Emitter<AddingState> emit,
  ) async {
    try {
      emit(
        LoadingState(),
      );

      await ApiProvider().sendNewTrashReport(
        emailValue: event.emailValue,
        textValue: event.textValue,
        selectedLat: event.selectedLat,
        selectedLong: event.selectedLong,
        imageFiles: event.imageFiles,
      );

      emit(
        ConfirmationState(),
      );
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Įvyko netikėta klaida'),
      );
    }
  }

  Future<void> _onReloadEvent(
    ReloadPage _,
    Emitter<AddingState> emit,
  ) async {
    add(LoadData());
  }
}
