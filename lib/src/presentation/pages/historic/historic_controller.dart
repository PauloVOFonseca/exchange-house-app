import 'package:exchange_house_app/src/application/services/locator.dart';
import 'package:exchange_house_app/src/domain/entities/conversion_history/conversion_history_entity.dart';
import 'package:exchange_house_app/src/domain/use_cases/get_all_conversions/get_all_conversions_usecase.dart';

class HistoricController {
  final GetAllConversionsUseCase _getAllConversionsUseCase =
      getIt<GetAllConversionsUseCase>();

  Future<List<ConversionHistoryEntity>>? getAllConversions() async {
    //! This only exists to test the loading
    await Future.delayed(const Duration(seconds: 2), () async {});

    final result = await _getAllConversionsUseCase.call();
    List<ConversionHistoryEntity> allConversionList = [];

    result.map((list) => allConversionList = list);

    return allConversionList;
  }
}
