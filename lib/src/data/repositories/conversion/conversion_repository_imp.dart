import 'package:dartz/dartz.dart';
import 'package:exchange_house_app/src/data/data_sources/conversion/conversion_datasource.dart';
import 'package:exchange_house_app/src/data/exceptions/request/request_exception.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_entity.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_request_entity.dart';
import 'package:exchange_house_app/src/domain/entities/failure/failure.dart';
import 'package:exchange_house_app/src/domain/repositories/conversion/conversion_repository.dart';

class ConversionRepositoryImp implements ConversionRepository {
  final ConversionDatasource conversionDataSource;

  ConversionRepositoryImp({required this.conversionDataSource});

  @override
  Future<Either<RequestFailure, ConversionEntity>> getCoinConversion({
    required ConversionRequestEntity entity,
  }) async {
    try {
      final result = await conversionDataSource.getConversion(
        entity: entity,
      );
      return Right(result);
    } on RequestException catch (error) {
      return Left(
        RequestFailure(
          requestFailureType: convertToRequestFailure(error.statusCode),
          message: error.message,
        ),
      );
    } on Exception catch (error) {
      return Left(
        RequestFailure(
          message: error.toString(),
          requestFailureType: RequestFailureType.serverError,
        ),
      );
    }
  }
}
