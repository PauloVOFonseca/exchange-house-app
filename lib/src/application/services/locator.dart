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
import 'package:exchange_house_app/src/domain/use_cases/get_conversion/get_conversion_usecase.dart';
import 'package:exchange_house_app/src/domain/use_cases/get_conversion/get_conversion_usecase_imp.dart';
import 'package:exchange_house_app/src/domain/use_cases/save_conversion/save_conversion_usecase.dart';
import 'package:exchange_house_app/src/domain/use_cases/save_conversion/save_conversion_usecase_imp.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<ConversionDatasource>(
      () => ConversionDatasourceImp());
  getIt.registerLazySingleton<ConversionRepository>(
      () => ConversionRepositoryImp());
  getIt.registerLazySingleton<GetConversionUseCase>(
      () => GetConversionUseCaseImp());

  getIt.registerLazySingleton<ConversionHistoryDatasource>(
      () => ConversionHistoryDatasourceImp());
  getIt.registerLazySingleton<ConversionHistoryRepository>(
      () => ConversionHistoryRepositoryImp());
  getIt.registerLazySingleton<SaveConversionUsecase>(
      () => SaveConversionUsecaseImp());

  getIt.registerLazySingleton<HttpClient>(() => HttpClientImp());
  getIt.registerLazySingleton<DBClient>(() => DBClientImp());
}
