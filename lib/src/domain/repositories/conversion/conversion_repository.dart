import 'package:dartz/dartz.dart';

abstract class ConversionRepository {
  Future<Either<String, dynamic>> getCoinConversion({
    required String baseCoin,
    required String convertCoin,
    required double amount,
  });
}
