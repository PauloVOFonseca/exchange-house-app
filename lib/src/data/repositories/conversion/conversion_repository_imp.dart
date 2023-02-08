import 'package:dartz/dartz.dart';
import 'package:exchange_house_app/src/application/services/locator.dart';
import 'package:exchange_house_app/src/data/data_sources/conversion/conversion_datasource.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_entity.dart';
import 'package:exchange_house_app/src/domain/repositories/conversion/conversion_repository.dart';

class ConversionRepositoryImp implements ConversionRepository {
  final ConversionDatasource conversionDataSource =
      getIt<ConversionDatasource>();

  @override
  Future<Either<String, ConversionEntity>> getCoinConversion({
    required String baseCoin,
    required String convertCoin,
    required double amount,
  }) async {
    try {
      final result = await conversionDataSource.getConversion(
        baseCoin: baseCoin,
        convertCoin: convertCoin,
        amount: amount,
      );
      return Right(result);
    } on Exception catch (error) {
      return Left(
        error.toString(),
      );
    }
  }
}
