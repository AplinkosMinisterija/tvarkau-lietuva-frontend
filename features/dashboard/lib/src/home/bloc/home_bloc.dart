import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(LoadingState()) {
    on<LoadData>(_onLoadData);
    on<ChangeCategory>(_onChangeCategory);
    on<LoadTrashData>(_onLoadTrashData);
    on<LoadDumpsData>(_onLoadDumpsData);
    on<LoadPermitsData>(_onLoadPermitsData);
    on<LoadForestData>(_onLoadForestData);
    on<ReloadPage>(_onReloadEvent);
  }

  Future<void> _onLoadData(
    LoadData event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(LoadingState());
      final String? activeCategory =
          await SecureStorageProvider().getActiveCategory();
      if (activeCategory != null) {
        add(getEventByCategory(activeCategory));
      } else {
        add(LoadTrashData());
      }
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Netikėta klaida', type: 'trash'),
      );
    }
  }

  Future<void> _onChangeCategory(
    ChangeCategory event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(LoadingState());
      await SecureStorageProvider().setActiveCategory(event.category);
      add(getEventByCategory(event.category));
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Netikėta klaida', type: 'trash'),
      );
    }
  }

  Future<void> _onLoadTrashData(
    LoadTrashData _,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(LoadingState());
      final CameraPosition? cameraPosition =
          await SecureStorageProvider().getCameraSetup();
      final responses = await Future.wait(
        [
          ApiProvider().getAllVisibleReports('trash'),
          ApiProvider().getReportStatistics('trash'),
        ],
        eagerError: true,
      );

      emit(
        TrashState(
          reports: responses[0] as List<PublicReportDto>,
          reportStatistics: responses[1] as ReportStatisticsDto,
          cameraPosition: cameraPosition ??
              const CameraPosition(target: LatLng(55.1736, 23.8948), zoom: 7.0),
        ),
      );
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Netikėta klaida', type: 'trash'),
      );
    }
  }

  Future<void> _onLoadDumpsData(
    LoadDumpsData _,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(LoadingState());
      final CameraPosition? cameraPosition =
          await SecureStorageProvider().getCameraSetup();
      final dumps = await ApiProvider().getAllVisibleDumpReports();

      emit(
        DumpsState(
          dumpReports: dumps,
          cameraPosition: cameraPosition ??
              const CameraPosition(target: LatLng(55.1736, 23.8948), zoom: 7.0),
        ),
      );
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Netikėta klaida', type: 'trash'),
      );
    }
  }

  Future<void> _onLoadForestData(
    LoadForestData _,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(LoadingState());
      final CameraPosition? cameraPosition =
          await SecureStorageProvider().getCameraSetup();
      final responses = await Future.wait(
        [
          ApiProvider().getAllVisibleReports('forest'),
          ApiProvider().getReportStatistics('forest'),
        ],
        eagerError: true,
      );

      emit(
        ForestState(
          reports: responses[0] as List<PublicReportDto>,
          reportStatistics: responses[1] as ReportStatisticsDto,
          cameraPosition: cameraPosition ??
              const CameraPosition(target: LatLng(55.1736, 23.8948), zoom: 7.0),
        ),
      );
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Netikėta klaida', type: 'forest'),
      );
    }
  }

  Future<void> _onLoadPermitsData(
    LoadPermitsData _,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(LoadingState());
      final CameraPosition? cameraPosition =
          await SecureStorageProvider().getCameraSetup();
      final responses = await Future.wait(
        [
          ApiProvider().getAllVisibleReports('permits'),
          ApiProvider().getReportStatistics('permits'),
        ],
        eagerError: true,
      );

      emit(
        PermitsState(
          reports: responses[0] as List<PublicReportDto>,
          reportStatistics: responses[1] as ReportStatisticsDto,
          cameraPosition: cameraPosition ??
              const CameraPosition(target: LatLng(55.1736, 23.8948), zoom: 7.0),
        ),
      );
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Netikėta klaida', type: 'forest'),
      );
    }
  }

  Future<void> _onReloadEvent(
    ReloadPage _,
    Emitter<HomeState> emit,
  ) async {
    add(LoadData());
  }

  HomeEvent getEventByCategory(String category) {
    switch (category) {
      case 'trash':
        return LoadTrashData();
      case 'forest':
        return LoadForestData();
      case 'permits':
        return LoadPermitsData();
      case 'dumps':
        return LoadDumpsData();
      default:
        return LoadTrashData();
    }
  }
}
