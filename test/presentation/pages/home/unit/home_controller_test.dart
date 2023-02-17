import 'package:exchange_house_app/src/application/services/locator.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_entity.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_request_entity.dart';
import 'package:exchange_house_app/src/domain/use_cases/get_conversion/get_conversion_usecase.dart';
import 'package:exchange_house_app/src/presentation/pages/home/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late GetConversionUseCase getConversionUseCase= getIt<GetConversionUseCase>();

  setUp(() {
    setupGetIt();
  });

  group('Test home controller', () {
    test('Switch currencies', () {
      final homeController = HomeController();
      expect(homeController.coinBase, 'BRL');
      expect(homeController.coinToConvert, 'USD');

      homeController.switchCoins();

      expect(homeController.coinBase, 'USD');
      expect(homeController.coinToConvert, 'BRL');
    });

    test('should return the correct ConversionEntity', () async {
      var response = await getConversionUseCase.call(
          entity: ConversionRequestEntity(
        baseCoin: "BRL",
        convertCoin: "USD",
        amount: 1,
      ));

      final result = response.fold((l) => l, (r) => r);
      expect(result, isA<ConversionEntity>());
    });
  });
}
