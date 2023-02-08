import 'package:exchange_house_app/src/application/services/locator.dart';
import 'package:exchange_house_app/src/presentation/pages/home/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  
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
  });
}
