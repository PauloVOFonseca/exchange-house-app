class ConversionRequestEntity {
  String baseCoin;
  String convertCoin;
  double amount;

  ConversionRequestEntity({
    required this.baseCoin,
    required this.convertCoin,
    required this.amount,
  });
}
