import 'package:exchange_house_app/src/domain/entities/conversion_history/conversion_history_entity.dart';

abstract class ConversionHistoryDatasource {
  Future<bool> saveConversion({
    required ConversionHistoryEntity entity,
  });

  Future<List<ConversionHistoryEntity>> getHistory();
}
