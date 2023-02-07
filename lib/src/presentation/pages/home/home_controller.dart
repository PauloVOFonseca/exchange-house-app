class HomeController {
  String coinBase = 'BRL';
  String coinToConvert = 'USD';
  double coinBaseValue = 0;
  double? convertedCoinValue;
  //* This is the converted value, but modified to be compared to the value of 1 base currency
  //* Ex: 5 USD = 1 BRL | 1 BRL = 0.2 USD. 0.2 USD is the convertedValueToBaseValue
  double? convertedValueToBaseValue; 

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

  void makeCurrencyExchange() {
    print(coinBase);
    print(coinToConvert);
  }
}
