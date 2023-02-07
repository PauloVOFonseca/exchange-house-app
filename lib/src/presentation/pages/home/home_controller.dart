class HomeController {
  String coinBase = 'BRL';
  String coinToConvert = 'USD';

  changeCoinBase(String newCoinValue) {
    coinBase = newCoinValue;
  }

  changeCoinToConvert(String newCoinValue) {
    coinToConvert = newCoinValue;
  }

  switchCoins() {
    final temp = coinBase;
    coinBase = coinToConvert;
    coinToConvert = temp;
  }
}
