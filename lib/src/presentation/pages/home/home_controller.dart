import 'package:exchange_house_app/src/application/services/locator.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_entity.dart';
import 'package:exchange_house_app/src/domain/entities/conversion/conversion_request_entity.dart';
import 'package:exchange_house_app/src/domain/entities/conversion_history/conversion_history_entity.dart';
import 'package:exchange_house_app/src/domain/use_cases/get_conversion/get_conversion_usecase.dart';
import 'package:exchange_house_app/src/domain/use_cases/save_conversion/save_conversion_usecase.dart';
import 'package:flutter/material.dart';

enum HomePageState { initial, loading, loaded, error }

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

  final SaveConversionUsecase _saveConversionUseCase =
      getIt<SaveConversionUsecase>();

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
        _pageState = HomePageState.error;
      }, (conversionEntity) async {
        convertedCoinValue = conversionEntity.result;
        calculateValues(conversionEntity);

        _pageState = HomePageState.loaded;

        await saveConversionOnLocal(amount);
      });

      notifyListeners();
    }
  }

  void calculateValues(ConversionEntity conversionEntity) {
    coinBaseComparedToConverted =
        conversionEntity.result / conversionEntity.query["amount"];
    convertedCoinComparedToBase = 1 / coinBaseComparedToConverted!;
  }

  Future<void> saveConversionOnLocal(String amount) async {
    await _saveConversionUseCase.call(
        entity: ConversionHistoryEntity(
      conversionDate: DateTime.now().toString(),
      baseCurrency: coinBase,
      convertCurrency: coinToConvert,
      amount: double.parse(amount),
      result: convertedCoinValue!,
    ));
  }
}
