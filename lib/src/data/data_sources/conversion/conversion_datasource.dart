import 'package:exchange_house_app/src/domain/entities/conversion/conversion_entity.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_request_entity.dart';

abstract class ConversionDatasource {
  Future<ConversionEntity> getConversion({
    required ConversionRequestEntity entity,
  });
}
