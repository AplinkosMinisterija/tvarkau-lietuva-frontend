import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:data/data.dart';
import 'package:http/src/response.dart' as http;
import 'package:http/http.dart' as https;

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
      final MapperFactory mapper = MapperFactory();
      final ApiProviderBase apiProviderBase = ApiProviderBase(
          baseUrl: HttpApiConstants.devBaseUrl, errorHandler: ErrorHandler());
      final ApiProvider apiProvider = ApiProvider(
        mapper: mapper,
        apiProviderBase: apiProviderBase,
      );

      final List<ReportModel> trashReports =
      await apiProvider.getAllVisibleTrashReports();

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
      final MapperFactory mapper = MapperFactory();
      final ApiProviderBase apiProviderBase = ApiProviderBase(
          baseUrl: HttpApiConstants.devBaseUrl, errorHandler: ErrorHandler());
      final ApiProvider apiProvider = ApiProvider(
        mapper: mapper,
        apiProviderBase: apiProviderBase,
      );

      var response = await apiProvider.sendNewTrashReport(
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
