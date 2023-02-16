import 'package:dartz/dartz.dart';
import 'package:exchange_house_app/src/domain/entities/conversion_history/conversion_history_entity.dart';


abstract class GetAllConversionsUseCase {
  Future<Either<String, List<ConversionHistoryEntity>>> call();
}
