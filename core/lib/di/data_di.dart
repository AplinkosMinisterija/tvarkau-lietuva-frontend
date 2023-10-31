import 'package:core/core.dart';
import 'package:data/errors/http_errors/error_handler.dart';
import 'package:data/mappers/mappers.dart';
import 'package:data/providers/http_api_provider/api_provider.dart';
import 'package:data/providers/http_api_provider/api_provider_base.dart';
import 'package:data/repositories/report_repository_impl.dart';
import 'package:domain/domain.dart';
import 'package:tvarkau_lietuva/app/app_config.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies(Flavor flavor) async {
    appLocator.registerLazySingleton<ErrorHandler>(
      ErrorHandler.new,
    );

    appLocator.registerLazySingleton<ApiProviderBase>(
      () => ApiProviderBase(
        baseUrl: AppConfig.fromFlavor(flavor).baseUrl,
        errorHandler: appLocator.get<ErrorHandler>(),
      ),
    );

    appLocator.registerLazySingleton<ApiProvider>(
      () => ApiProvider(
        mapper: MapperFactory(),
        apiProviderBase: appLocator.get<ApiProviderBase>(),
      ),
    );

    appLocator.registerLazySingleton<ReportRepository>(
      () => ReportRepositoryImpl(
        apiProvider: appLocator.get<ApiProvider>(),
      ),
    );
  }
}
