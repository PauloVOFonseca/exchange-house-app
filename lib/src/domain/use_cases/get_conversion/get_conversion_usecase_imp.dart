import 'package:dartz/dartz.dart';
import 'package:exchange_house_app/src/application/services/locator.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_entity.dart';
import 'package:exchange_house_app/src/domain/repositories/conversion/conversion_repository.dart';
import 'package:exchange_house_app/src/domain/use_cases/get_conversion/get_conversion_usecase.dart';

class GetConversionUseCaseImp implements GetConversionUseCase {
  final ConversionRepository conversionRepository =
      getIt<ConversionRepository>();

  @override
  Future<Either<String, ConversionEntity>> call({
    required String baseCoin,
    required String convertCoin,
    required double amount,
  }) async {
    return await conversionRepository.getCoinConversion(
      baseCoin: baseCoin,
      convertCoin: convertCoin,
      amount: amount,
    );
  }
}
