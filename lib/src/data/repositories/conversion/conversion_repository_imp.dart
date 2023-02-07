import 'package:dartz/dartz.dart';
import 'package:exchange_house_app/src/application/services/locator.dart';
import 'package:exchange_house_app/src/data/data_sources/conversion/conversion_datasource.dart';
import 'package:exchange_house_app/src/domain/repositories/conversion/conversion_repository.dart';

class ConversionRepositoryImp implements ConversionRepository {
  final ConversionDatasource conversionDataSource =
      getIt<ConversionDatasource>();

  @override
  Future<Either<String, dynamic>> getCoinConversion() async {
    try {
      final result = await conversionDataSource.getConversion();
      return Right(result);
    } on Exception catch (error) {
      return Left(
        error.toString(),
      );
    }
  }
}
