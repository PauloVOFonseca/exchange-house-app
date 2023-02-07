import 'package:dartz/dartz.dart';
import 'package:exchange_house_app/src/application/services/locator.dart';
import 'package:exchange_house_app/src/domain/repositories/conversion/conversion_repository.dart';
import 'package:exchange_house_app/src/domain/use_cases/get_conversion/get_conversion_usecase.dart';

class GetConversionUseCaseImp implements GetConversionUseCase {
  final ConversionRepository conversionRepository =
      getIt<ConversionRepository>();

  @override
  Future<Either<String, dynamic>> call() async {
    return await conversionRepository.getCoinConversion();
  }
}
