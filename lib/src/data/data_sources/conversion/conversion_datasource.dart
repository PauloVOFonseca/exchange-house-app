abstract class ConversionDatasource {
  Future<dynamic> getConversion({
    required String baseCoin,
    required String convertCoin,
    required double amount,
  });
}
