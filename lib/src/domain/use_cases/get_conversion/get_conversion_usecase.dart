import 'package:dartz/dartz.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_entity.dart';

abstract class GetConversionUseCase {
  Future<Either<String, ConversionEntity>> call({
    required String baseCoin,
    required String convertCoin,
    required double amount,
  });
}
