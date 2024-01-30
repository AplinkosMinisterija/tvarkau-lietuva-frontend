import 'package:api_client/api_client.dart';
import 'package:core/core.dart';

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
      final responses = await Future.wait(
        [
          ApiProvider().getAllVisibleTrashReports(),
          ApiProvider().getAllVisibleDumpReports(),
          ApiProvider().getReportStatistics(),
        ],
        eagerError: true,
      );
      emit(
        ContentState(
          trashReports: responses[0] as List<PublicReportDto>,
          dumpReports: responses[1] as List<DumpDto>,
          reportStatistics: responses[2] as ReportStatisticsDto,
        ),
      );
    } catch (e) {
      print(e);
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
