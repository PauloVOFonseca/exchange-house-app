import 'package:dartz/dartz.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_entity.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_request_entity.dart';
import 'package:exchange_house_app/src/domain/entities/failure/failure.dart';

abstract class ConversionRepository {
  Future<Either<RequestFailure, ConversionEntity>> getCoinConversion({
    required ConversionRequestEntity entity,
  });
}
