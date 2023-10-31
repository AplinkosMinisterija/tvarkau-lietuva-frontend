import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:openid_client/openid_client.dart';

part 'admin_event.dart';

part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc() : super(LoadingState()) {
    on<LoadData>(_onLoadData);
    on<ReloadPage>(_onReloadEvent);
    on<LogIn>(_onLogInEvent);
    on<LogOut>(_onLogOutEvent);
    add(LoadData());
  }

  Future<void> _onLoadData(
    LoadData _,
    Emitter<AdminState> emit,
  ) async {
    try {
      emit(LoadingState());
      GlobalKey<NavigatorState> navKey = GlobalKey();
      var config = Config(
        tenant: '74edcdf9-ca2e-4601-9982-4e2df1ba3a54',
        clientId: '0408503a-ada6-4a72-8823-c52ca0fe5b43',
        scope: 'openid profile offline_access user.read',
        navigatorKey: navKey,
        loader: LoadingAnimationWidget.staggeredDotsWave(
            color: AppTheme.mainThemeColor, size: 150),
      );
      var oauth = AadOAuth(config);
      final MapperFactory mapper = MapperFactory();
      final ApiProviderBase apiProviderBase = ApiProviderBase(
          baseUrl: HttpApiConstants.devBaseUrl, errorHandler: ErrorHandler());
      final ApiProvider apiProvider = ApiProvider(
        mapper: mapper,
        apiProviderBase: apiProviderBase,
      );

      var hasCachedAccountInformation = await oauth.hasCachedAccountInformation;
      if (hasCachedAccountInformation) {
        var accessToken = await oauth.getAccessToken();
        if (accessToken != null && accessToken != '') {
          (UserInfo, String?) userInfo =
              await apiProvider.getUserInfo(accessToken);

          if (userInfo.$2 != null) {
            await SecureStorageProvider().setJwtToken(userInfo.$2 ?? '');
            emit(ContentState(userInfo: userInfo.$1));
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
        ErrorState(errorMessage: 'Something went wrong'),
      );
    }
  }

  Future<void> _onLogOutEvent(
    LogOut _,
    Emitter<AdminState> emit,
  ) async {
    try {
      emit(LoadingState());
      GlobalKey<NavigatorState> navKey = GlobalKey();
      var config = Config(
        tenant: '74edcdf9-ca2e-4601-9982-4e2df1ba3a54',
        clientId: '0408503a-ada6-4a72-8823-c52ca0fe5b43',
        scope: 'openid profile offline_access user.read',
        navigatorKey: navKey,
        loader: LoadingAnimationWidget.staggeredDotsWave(
            color: AppTheme.mainThemeColor, size: 150),
      );
      config.webUseRedirect = false;
      var oauth = AadOAuth(config);
      SecureStorageProvider().deleteJwtToken();
      final result = await oauth.logout();
      var accessToken = await oauth.getAccessToken();
      if (accessToken != null) {
        emit(
          ErrorState(errorMessage: 'Something went wrong'),
        );
      } else {
        add(LoadData());
      }
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Something went wrong'),
      );
    }
  }

  Future<void> _onLogInEvent(
    LogIn _,
    Emitter<AdminState> emit,
  ) async {
    try {
      emit(LoadingState());
      GlobalKey<NavigatorState> navKey = GlobalKey();
      var config = Config(
        tenant: '74edcdf9-ca2e-4601-9982-4e2df1ba3a54',
        clientId: '0408503a-ada6-4a72-8823-c52ca0fe5b43',
        scope: 'openid profile offline_access user.read',
        navigatorKey: navKey,
        loader: LoadingAnimationWidget.staggeredDotsWave(
            color: AppTheme.mainThemeColor, size: 150),
      );
      config.webUseRedirect = false;
      var oauth = AadOAuth(config);

      final result = await oauth.login();
      var accessToken = await oauth.getAccessToken();

      if (accessToken != null) {
        add(LoadData());
      } else {
        emit(
          ErrorState(errorMessage: 'Something went wrong'),
        );
      }
    } catch (e) {
      emit(
        ErrorState(errorMessage: 'Something went wrong'),
      );
    }
  }

  Future<void> _onReloadEvent(
    ReloadPage _,
    Emitter<AdminState> emit,
  ) async {
    add(LoadData());
  }
}
