import 'package:exchange_house_app/src/application/services/locator.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_entity.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_request_entity.dart';
import 'package:exchange_house_app/src/domain/use_cases/get_conversion/get_conversion_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late GetConversionUseCase getConversionUseCase;

  setUp(() {
    setupGetIt();
    getConversionUseCase = getIt<GetConversionUseCase>();
  });

  group("description", () {
    test('should return the correct ConversionEntity', () async {
      final entity = ConversionRequestEntity(
        baseCoin: 'BRL',
        convertCoin: 'USD',
        amount: 5,
      );

      var response = await getConversionUseCase.call(entity: entity);

      final result = response.fold((l) => l, (r) => r);
      expect(result, isA<ConversionEntity>());
    });
  });
}
