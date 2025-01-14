import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:admin/src/auth/helpers/globals.dart';
import 'package:api_client/api_client.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

part 'admin_event.dart';

part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc() : super(LoadingState()) {
    on<LoadData>(_onLoadData);
    on<ReloadPage>(_onReloadEvent);
    on<LogIn>(_onLogInEvent);
    on<LogOut>(_onLogOutEvent);
    on<OnViewReports>(_onViewReportsEvent);
    on<OnViewDumps>(_onViewDumpsEvent);
    on<OnViewDeleted>(_onViewDeletedEvent);
    add(LoadData());
  }

  Future<void> _onLoadData(
    LoadData event,
    Emitter<AdminState> emit,
  ) async {
    try {
      emit(LoadingState());
      String? tenant = await SecureStorageProvider().getTenant();

      if (tenant != null && tenant != '') {
        final Config config = getConfigByTenant(tenant);
        var oauth = AadOAuth(config);

        var hasCachedAccountInformation =
            await oauth.hasCachedAccountInformation;
        if (hasCachedAccountInformation) {
          var accessToken = await oauth.getAccessToken();
          if (accessToken != null && accessToken != '') {
            try {
              LogInDto userInfo = await ApiProvider().getUserInfo(accessToken);
              await SecureStorageProvider().setUserInfo(userInfo);
              await SecureStorageProvider().setJwtToken(userInfo.accessKey);

              List<FullReportDto> reports =
                  await ApiProvider().getAllTrashReports('trash');

              emit(ReportState(
                  reports: reports, userInfo: userInfo, category: 'trash'));
            } catch (e) {
              emit(
                ErrorState(
                  errorMessage: 'Sistemos klaida',
                  errorDescription: e.toString(),
                ),
              );
            }
          } else {
            emit(LogingState());
          }
        } else {
          emit(LogingState());
        }
      } else {
        emit(LogingState());
      }
    } catch (e) {
      emit(
        ErrorState(
            errorMessage: 'Sistemos klaida', errorDescription: e.toString()),
      );
    }
  }

  Future<void> _onViewReportsEvent(
    OnViewReports event,
    Emitter<AdminState> emit,
  ) async {
    try {
      emit(LoadingState());
      LogInDto userInfo = await SecureStorageProvider().getUserInfo();
      List<FullReportDto> reports =
          await ApiProvider().getAllTrashReports(event.category);
      emit(ReportState(
          reports: reports, userInfo: userInfo, category: event.category));
    } catch (e) {
      emit(
        ErrorState(
            errorMessage: 'Sistemos klaida', errorDescription: e.toString()),
      );
    }
  }

  Future<void> _onViewDeletedEvent(
    OnViewDeleted event,
    Emitter<AdminState> emit,
  ) async {
    try {
      emit(LoadingState());
      LogInDto userInfo = await SecureStorageProvider().getUserInfo();
      List<FullReportDto> reports =
          await ApiProvider().getAllRemovedReports(event.category);
      emit(DeletedState(
          reports: reports, userInfo: userInfo, category: event.category));
    } catch (e) {
      emit(
        ErrorState(
            errorMessage: 'Sistemos klaida', errorDescription: e.toString()),
      );
    }
  }

  Future<void> _onViewDumpsEvent(
    OnViewDumps _,
    Emitter<AdminState> emit,
  ) async {
    try {
      emit(LoadingState());
      LogInDto userInfo = await SecureStorageProvider().getUserInfo();
      List<FullDumpDto> dumps = await ApiProvider().getAllDumpReports();
      emit(DumpState(dumps: dumps, userInfo: userInfo));
    } catch (e) {
      emit(
        ErrorState(
            errorMessage: 'Sistemos klaida', errorDescription: e.toString()),
      );
    }
  }

  Future<void> _onLogOutEvent(
    LogOut event,
    Emitter<AdminState> emit,
  ) async {
    try {
      emit(LoadingState());
      String? tenant = await SecureStorageProvider().getTenant();
      if (tenant == null || tenant == '') {
        emit(LogingState());
      }
      final Config config = getConfigByTenant(tenant!);
      config.webUseRedirect = false;
      var oauth = AadOAuth(config);
      SecureStorageProvider().deleteJwtToken();
      SecureStorageProvider().deleteTenant();
      await oauth.logout();
      var accessToken = await oauth.getAccessToken();
      if (accessToken != null) {
        emit(
          ErrorState(
              errorMessage: 'Sistemos klaida',
              errorDescription: 'Autentifikavimo klaida'),
        );
      } else {
        add(LoadData());
      }
    } catch (e) {
      emit(
        ErrorState(
            errorMessage: 'Sistemos klaida', errorDescription: e.toString()),
      );
    }
  }

  Future<void> _onLogInEvent(
    LogIn event,
    Emitter<AdminState> emit,
  ) async {
    try {
      emit(LoadingState());
      await SecureStorageProvider().setTenant(event.tenant);
      final Config config = getConfigByTenant(event.tenant);
      config.webUseRedirect = false;
      var oauth = AadOAuth(config);

      await oauth.login();
      var accessToken = await oauth.getAccessToken();

      if (accessToken != null) {
        add(LoadData());
      } else {
        emit(
          ErrorState(
              errorMessage: 'Sistemos klaida',
              errorDescription: 'Autorizacijos klaida. Pabandyti dar kartą'),
        );
      }
    } catch (e) {
      emit(
        ErrorState(
            errorMessage: 'Sistemos klaida', errorDescription: e.toString()),
      );
    }
  }

  Future<void> _onReloadEvent(
    ReloadPage _,
    Emitter<AdminState> emit,
  ) async {
    add(LoadData());
  }

  Config getConfigByTenant(String tenant) {
    GlobalKey<NavigatorState> navKey = GlobalKey();
    Widget loader = LoadingAnimationWidget.staggeredDotsWave(
        color: AppTheme.mainThemeColor, size: 150);
    switch (tenant) {
      case 'aad':
        return Config(
          tenant: Globals.aadTenantId,
          clientId: Globals.aadClientId,
          scope: Globals.aadScope,
          navigatorKey: navKey,
          loader: loader,
        );
      case 'amvmt':
        return Config(
          tenant: Globals.amvmtTenantId,
          clientId: Globals.amvmtClientId,
          scope: Globals.amvmtScope,
          navigatorKey: navKey,
          loader: loader,
        );
      default:
        return Config(
          tenant: '',
          clientId: '',
          scope: '',
          navigatorKey: navKey,
          loader: loader,
        );
    }
  }
}
