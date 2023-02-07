import 'package:dartz/dartz.dart';

abstract class ConversionRepository {
  Future<Either<String, dynamic>> getCoinConversion();
}
