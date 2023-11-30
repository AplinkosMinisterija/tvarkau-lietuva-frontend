import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:data/data.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(LoadingState()) {
    on<LoadData>(_onLoadData);
    on<ReloadPage>(_onReloadEvent);
    add(LoadData());
  }

  Future<void> _onLoadData(
    LoadData _,
    Emitter<HomeState> emit,
  ) async {
    try {
      final ApiProviderBase apiProviderBase = ApiProviderBase(
        baseUrl: HttpApiConstants.devBaseUrl,
      );
      final ApiProvider apiProvider = ApiProvider(
        apiProviderBase: apiProviderBase,
      );

      final List<ReportModel> trashReports =
          await apiProvider.getAllVisibleTrashReports();
      final List<DumpDto> dumpReports =
          await apiProvider.getAllVisibleDumpReports();
      emit(
        ContentState(
          trashReports: trashReports,
          dumpReports: dumpReports,
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
    Emitter<HomeState> emit,
  ) async {
    add(LoadData());
  }
}
