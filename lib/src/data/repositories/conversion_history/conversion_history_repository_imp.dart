import 'package:dartz/dartz.dart';
import 'package:exchange_house_app/src/data/data_sources/conversion_history/conversion_history_datasource.dart';
import 'package:exchange_house_app/src/domain/entities/conversion_history/conversion_history_entity.dart';
import 'package:exchange_house_app/src/domain/repositories/conversion_history/conversion_history_repository.dart';

class ConversionHistoryRepositoryImp implements ConversionHistoryRepository {
  final ConversionHistoryDatasource dataSource;

  ConversionHistoryRepositoryImp({required this.dataSource});

  @override
  Future<Either<String, bool>> saveConversion({
    required ConversionHistoryEntity entity,
  }) async {
    try {
      final result = await dataSource.saveConversion(
        entity: entity,
      );
      return Right(result);
    } on Exception catch (error) {
      return Left(
        error.toString(),
      );
    }
  }
}
