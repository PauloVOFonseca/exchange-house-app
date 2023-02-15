import 'package:dartz/dartz.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_entity.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_request_entity.dart';
import 'package:exchange_house_app/src/domain/repositories/conversion/conversion_repository.dart';
import 'package:exchange_house_app/src/domain/use_cases/get_conversion/get_conversion_usecase.dart';

class GetConversionUseCaseImp implements GetConversionUseCase {
  final ConversionRepository conversionRepository;

  GetConversionUseCaseImp({required this.conversionRepository});

  @override
  Future<Either<String, ConversionEntity>> call({
    required ConversionRequestEntity entity,
  }) async {
    return await conversionRepository.getCoinConversion(entity: entity);
  }
}
