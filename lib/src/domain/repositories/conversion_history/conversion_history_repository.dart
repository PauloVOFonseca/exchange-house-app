import 'package:dartz/dartz.dart';
import 'package:exchange_house_app/src/domain/entities/conversion_history/conversion_history_entity.dart';

abstract class ConversionHistoryRepository {
  Future<Either<String, bool>> saveConversion({
    required ConversionHistoryEntity entity,
  });

  Future<Either<String, List<ConversionHistoryEntity>>> getAllConversions();
}
