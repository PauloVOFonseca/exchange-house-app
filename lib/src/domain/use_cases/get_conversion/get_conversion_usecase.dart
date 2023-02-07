import 'package:dartz/dartz.dart';

abstract class GetConversionUseCase {
  Future<Either<String, dynamic>> call();
}
