import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:data/data.dart';
import 'package:flutter/cupertino.dart';

part 'information_event.dart';

part 'information_state.dart';

class InformationBloc extends Bloc<InformationEvent, InformationState> {
  final String refId;
  InformationBloc({required this.refId,}) : super(LoadingState()) {

    on<LoadData>(_onLoadData);
    on<ReloadPage>(_onReloadEvent);
    add(LoadData(refId: refId));
  }

  Future<void> _onLoadData(
    LoadData event,
    Emitter<InformationState> emit,
  ) async {
    try {
      final MapperFactory mapper = MapperFactory();
      final ApiProviderBase apiProviderBase = ApiProviderBase(
          baseUrl: HttpApiConstants.devBaseUrl, errorHandler: ErrorHandler());
      final ApiProvider apiProvider = ApiProvider(
        mapper: mapper,
        apiProviderBase: apiProviderBase,
      );
      final ReportModel trashReport = await apiProvider.getOneTrashReport(event.refId,);
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
