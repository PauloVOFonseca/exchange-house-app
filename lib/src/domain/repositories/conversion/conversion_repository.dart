import 'package:dartz/dartz.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_entity.dart';

abstract class ConversionRepository {
  Future<Either<String, ConversionEntity>> getCoinConversion({
    required String baseCoin,
    required String convertCoin,
    required double amount,
  });
}
