import 'package:dartz/dartz.dart';

abstract class GetConversionUseCase {
  Future<Either<String, dynamic>> call({
    required String baseCoin,
    required String convertCoin,
    required double amount,
  });
}
