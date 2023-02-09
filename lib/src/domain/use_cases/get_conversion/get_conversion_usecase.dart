import 'package:dartz/dartz.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_entity.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_request_entity.dart';

abstract class GetConversionUseCase {
  Future<Either<String, ConversionEntity>> call({
    required ConversionRequestEntity entity,
  });
}
