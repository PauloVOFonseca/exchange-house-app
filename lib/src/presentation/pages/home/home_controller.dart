import 'package:exchange_house_app/src/application/services/locator.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_entity.dart';
import 'package:exchange_house_app/src/domain/use_cases/get_conversion/get_conversion_usecase.dart';

class HomeController {
  String coinBase = 'BRL';
  String coinToConvert = 'USD';
  double? convertedCoinValue;
  //* This is the converted value, but modified to be compared to the value of 1 base currency
  //* Ex: 1 USD = 5 BRL | 1 BRL = 0.2 USD. 0.2 USD is the coinBaseComparedToConverted and 5 BRL is convertedCoinComparedToBase
  double? coinBaseComparedToConverted;
  double? convertedCoinComparedToBase;

  final GetConversionUseCase _getConversionUseCase =
      getIt<GetConversionUseCase>();

  void changeCoinBase(String newCoinValue) {
    coinBase = newCoinValue;
  }

  void changeCoinToConvert(String newCoinValue) {
    coinToConvert = newCoinValue;
  }

  void switchCoins() {
    final temp = coinBase;
    coinBase = coinToConvert;
    coinToConvert = temp;
  }

  Future<void> makeCurrencyExchange(String amount) async {
    if (amount.isNotEmpty) {
      final response = await _getConversionUseCase.call(
        baseCoin: coinBase,
        convertCoin: coinToConvert,
        amount: double.parse(amount),
      );

      response.fold((error) {
        print(error);
      }, (conversionEntity) {
        convertedCoinValue = conversionEntity.result;
        calculateValues(conversionEntity);
      });
    }
  }

  void calculateValues(ConversionEntity conversionEntity) {
    convertedCoinComparedToBase =
        conversionEntity.result / conversionEntity.query["amount"];
    coinBaseComparedToConverted = 1 / convertedCoinComparedToBase!;
  }
}
