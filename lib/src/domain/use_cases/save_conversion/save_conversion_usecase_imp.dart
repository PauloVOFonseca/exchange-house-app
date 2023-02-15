import 'package:exchange_house_app/src/domain/entities/conversion_history/conversion_history_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:exchange_house_app/src/domain/repositories/conversion_history/conversion_history_repository.dart';
import 'package:exchange_house_app/src/domain/use_cases/save_conversion/save_conversion_usecase.dart';

class SaveConversionUsecaseImp extends SaveConversionUsecase {
  final ConversionHistoryRepository repository;

  SaveConversionUsecaseImp({required this.repository});

  @override
  Future<Either<String, bool>> call(
      {required ConversionHistoryEntity entity}) async {
    return await repository.saveConversion(entity: entity);
  }
}
