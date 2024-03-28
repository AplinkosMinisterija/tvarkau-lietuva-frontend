import 'dart:typed_data';

import 'package:api_client/api_client.dart';
import 'package:core/core.dart';

part 'adding_event.dart';

part 'adding_state.dart';

class AddingBloc extends Bloc<AddingEvent, AddingState> {
  AddingBloc(this.type) : super(LoadingState()) {
    on<LoadTrashData>(_onLoadTrashData);
    on<LoadForestData>(_onLoadForestData);
    on<LoadBeetleData>(_onLoadBeetleData);
    on<LoadBeetleInformation>(_onLoadBeetleInformation);
    on<AddBeetleReport>(_onAddBeetleReport);
    on<AddReport>(_onAddReport);
    on<ReloadPage>(_onReloadEvent);
  }

  final String type;

  Future<void> _onLoadTrashData(
    LoadTrashData _,
    Emitter<AddingState> emit,
  ) async {
    try {
      final List<PublicReportDto> trashReports =
          await ApiProvider().getAllVisibleReports('trash');

      emit(
        TrashContentState(
          trashReports: trashReports,
        ),
      );
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Netikėta klaida'),
      );
    }
  }

  Future<void> _onLoadForestData(
    LoadForestData _,
    Emitter<AddingState> emit,
  ) async {
    try {
      final List<PublicReportDto> trashReports =
          await ApiProvider().getAllVisibleReports('forest');

      emit(
        ForestContentState(
          forestReports: trashReports,
        ),
      );
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Netikėta klaida'),
      );
    }
  }

  Future<void> _onLoadBeetleData(
    LoadBeetleData _,
    Emitter<AddingState> emit,
  ) async {
    try {
      emit(LoadingState());

      emit(
        BeetleContentState(),
      );
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Netikėta klaida'),
      );
    }
  }

  Future<void> _onLoadBeetleInformation(
    LoadBeetleInformation _,
    Emitter<AddingState> emit,
  ) async {
    try {
      emit(LoadingState());

      emit(
        BeetleInformationState(),
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
        imageFiles: event.images,
        category: event.category,
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

  Future<void> _onAddBeetleReport(
    AddBeetleReport event,
    Emitter<AddingState> emit,
  ) async {
    try {
      emit(
        LoadingState(),
      );

      await ApiProvider().sendNewBeetleReport(
        emailValue: event.emailValue,
        textValue: event.textValue,
        selectedLat: event.selectedLat,
        selectedLong: event.selectedLong,
        imageFiles: event.images,
        category: event.category,
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
    type == 'trash' ? add(LoadTrashData()) : add(LoadForestData());
  }
}
