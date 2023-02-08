import 'package:exchange_house_app/src/domain/entities/conversion/conversion_entity.dart';

abstract class ConversionDatasource {
  Future<ConversionEntity> getConversion({
    required String baseCoin,
    required String convertCoin,
    required double amount,
  });
}
