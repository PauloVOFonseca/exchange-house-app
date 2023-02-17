import 'package:exchange_house_app/src/data/clients/db/db_client.dart';
import 'package:exchange_house_app/src/data/clients/db/db_client_imp.dart';
import 'package:exchange_house_app/src/data/clients/http/http_client.dart';
import 'package:exchange_house_app/src/data/clients/http/http_client_imp.dart';
import 'package:exchange_house_app/src/data/data_sources/conversion/conversion_datasource.dart';
import 'package:exchange_house_app/src/data/data_sources/conversion/conversion_datasource_imp.dart';
import 'package:exchange_house_app/src/data/data_sources/conversion_history/conversion_history_datasource.dart';
import 'package:exchange_house_app/src/data/data_sources/conversion_history/conversion_history_datasource_imp.dart';
import 'package:exchange_house_app/src/data/repositories/conversion/conversion_repository_imp.dart';
import 'package:exchange_house_app/src/data/repositories/conversion_history/conversion_history_repository_imp.dart';
import 'package:exchange_house_app/src/domain/repositories/conversion/conversion_repository.dart';
import 'package:exchange_house_app/src/domain/repositories/conversion_history/conversion_history_repository.dart';
import 'package:exchange_house_app/src/domain/use_cases/get_all_conversions/get_all_conversions_usecase.dart';
import 'package:exchange_house_app/src/domain/use_cases/get_all_conversions/get_all_conversions_usecase_imp.dart';
import 'package:exchange_house_app/src/domain/use_cases/get_conversion/get_conversion_usecase.dart';
import 'package:exchange_house_app/src/domain/use_cases/get_conversion/get_conversion_usecase_imp.dart';
import 'package:exchange_house_app/src/domain/use_cases/save_conversion/save_conversion_usecase.dart';
import 'package:exchange_house_app/src/domain/use_cases/save_conversion/save_conversion_usecase_imp.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  if (!getIt.isRegistered<HttpClient>()) {
    getIt.registerLazySingleton<HttpClient>(() => HttpClientImp());
  }
  if (!getIt.isRegistered<DBClient>()) {
    getIt.registerLazySingleton<DBClient>(() => DBClientImp());
  }

  if (!getIt.isRegistered<ConversionDatasource>()) {
    getIt.registerLazySingleton<ConversionDatasource>(
        () => ConversionDatasourceImp(httpClient: getIt<HttpClient>()));
  }
  if (!getIt.isRegistered<ConversionRepository>()) {
    getIt.registerLazySingleton<ConversionRepository>(() =>
        ConversionRepositoryImp(
            conversionDataSource: getIt<ConversionDatasource>()));
  }
  if (!getIt.isRegistered<GetConversionUseCase>()) {
    getIt.registerLazySingleton<GetConversionUseCase>(() =>
        GetConversionUseCaseImp(
            conversionRepository: getIt<ConversionRepository>()));
  }

  if (!getIt.isRegistered<ConversionHistoryDatasource>()) {
    getIt.registerLazySingleton<ConversionHistoryDatasource>(
        () => ConversionHistoryDatasourceImp(dbClient: getIt<DBClient>()));
  }
  if (!getIt.isRegistered<ConversionHistoryRepository>()) {
    getIt.registerLazySingleton<ConversionHistoryRepository>(() =>
        ConversionHistoryRepositoryImp(
            dataSource: getIt<ConversionHistoryDatasource>()));
  }
  if (!getIt.isRegistered<SaveConversionUsecase>()) {
    getIt.registerLazySingleton<SaveConversionUsecase>(() =>
        SaveConversionUsecaseImp(
            repository: getIt<ConversionHistoryRepository>()));
  }
  if (!getIt.isRegistered<GetAllConversionsUseCase>()) {
    getIt.registerLazySingleton<GetAllConversionsUseCase>(() =>
        GetAllConversionsUseCaseImp(
            repository: getIt<ConversionHistoryRepository>()));
  }
}
