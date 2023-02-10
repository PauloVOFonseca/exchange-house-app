import 'package:exchange_house_app/src/application/services/locator.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_entity.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_request_entity.dart';
import 'package:exchange_house_app/src/domain/use_cases/get_conversion/get_conversion_usecase.dart';
import 'package:flutter/material.dart';

enum HomePageState { initial, loading, loaded }

class HomeController with ChangeNotifier {
  String coinBase = 'BRL';
  String coinToConvert = 'USD';
  double? convertedCoinValue;
  //* This is the converted value, but modified to be compared to the value of 1 base currency
  //* Ex: 1 USD = 5 BRL | 1 BRL = 0.2 USD. 0.2 USD is the coinBaseComparedToConverted and 5 BRL is convertedCoinComparedToBase
  double? coinBaseComparedToConverted;
  double? convertedCoinComparedToBase;

  final GetConversionUseCase _getConversionUseCase =
      getIt<GetConversionUseCase>();

  HomePageState _pageState = HomePageState.initial;

  HomePageState get pageState => _pageState;

  void changeCoinBase(String newCoinValue) {
    coinBase = newCoinValue;
    notifyListeners();
  }

  void changeCoinToConvert(String newCoinValue) {
    coinToConvert = newCoinValue;
    notifyListeners();
  }

  void switchCoins() {
    final temp = coinBase;
    changeCoinBase(coinToConvert);
    changeCoinToConvert(temp);
  }

  Future<void> makeCurrencyExchange(String amount) async {
    _pageState = HomePageState.loading;
    notifyListeners();
    if (amount.isNotEmpty) {
      final response = await _getConversionUseCase.call(
        entity: ConversionRequestEntity(
          baseCoin: coinBase,
          convertCoin: coinToConvert,
          amount: double.parse(amount),
        ),
      );

      response.fold((error) {
        print(error);
      }, (conversionEntity) {
        convertedCoinValue = conversionEntity.result;
        calculateValues(conversionEntity);
        _pageState = HomePageState.loaded;
        notifyListeners();
      });
    }
  }

  void calculateValues(ConversionEntity conversionEntity) {
    coinBaseComparedToConverted =
        conversionEntity.result / conversionEntity.query["amount"];
    convertedCoinComparedToBase = 1 / coinBaseComparedToConverted!;
  }
}
