import 'dart:typed_data';

import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:core/utils/permit.dart';

part 'adding_event.dart';

part 'adding_state.dart';

class AddingBloc extends Bloc<AddingEvent, AddingState> {
  AddingBloc(this.type) : super(LoadingState()) {
    on<LoadTrashData>(_onLoadTrashData);
    on<LoadForestData>(_onLoadForestData);
    on<LoadPermitsData>(_onLoadPermitsData);
    on<LoadPermitsInformation>(_onLoadPermitsInformation);
    on<LoadBeetleData>(_onLoadBeetleData);
    on<LoadBeetleInformation>(_onLoadBeetleInformation);
    on<AddReport>(_onAddReport);
    on<ReloadPage>(_onReloadEvent);
  }

  final String type;

  Future<void> _onLoadTrashData(
    LoadTrashData _,
    Emitter<AddingState> emit,
  ) async {
    try {
      emit(LoadingState());
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
      emit(LoadingState());
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

  Future<void> _onLoadPermitsData(
    LoadPermitsData _,
    Emitter<AddingState> emit,
  ) async {
    try {
      emit(LoadingState());
      final Permit permits = await ApiProvider().getAllPermits();
      //TODO: final source = GeoJSONFeatures.http(location: Uri.parse('...'));

      final List<PublicReportDto> permitReports =
          await ApiProvider().getAllVisibleReports('permits');

      emit(
        PermitsContentState(
          permits: permits,
          permitReports: permitReports,
        ),
      );
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Netikėta klaida'),
      );
    }
  }

  Future<void> _onLoadPermitsInformation(
      LoadPermitsInformation _,
      Emitter<AddingState> emit,
      ) async {
    try {
      emit(LoadingState());

      emit(
        PermitsInformationState(),
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

  Future<void> _onReloadEvent(
    ReloadPage _,
    Emitter<AddingState> emit,
  ) async {
    switch (type) {
      case 'trash':
        add(LoadTrashData());
      case 'forest':
        add(LoadForestData());
      case 'beetle':
        add(LoadBeetleData());
      case 'permits':
        add(LoadPermitsData());
    }
  }
}
