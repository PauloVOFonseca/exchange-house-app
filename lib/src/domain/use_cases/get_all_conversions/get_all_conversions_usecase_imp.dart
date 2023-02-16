import 'package:dartz/dartz.dart';
import 'package:exchange_house_app/src/domain/entities/conversion_history/conversion_history_entity.dart';
import 'package:exchange_house_app/src/domain/repositories/conversion_history/conversion_history_repository.dart';
import 'package:exchange_house_app/src/domain/use_cases/get_all_conversions/get_all_conversions_usecase.dart';

class GetAllConversionsUseCaseImp implements GetAllConversionsUseCase {
  final ConversionHistoryRepository repository;

  GetAllConversionsUseCaseImp({required this.repository});

  @override
  Future<Either<String, List<ConversionHistoryEntity>>> call() async {
    return await repository.getAllConversions();
  }
}
