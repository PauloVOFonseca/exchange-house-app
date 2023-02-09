import 'package:dartz/dartz.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_entity.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_request_entity.dart';

abstract class ConversionRepository {
  Future<Either<String, ConversionEntity>> getCoinConversion({
    required ConversionRequestEntity entity,
  });
}
