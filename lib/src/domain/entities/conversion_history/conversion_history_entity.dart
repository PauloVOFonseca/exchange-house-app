class ConversionHistoryEntity {
  int? id;
  final String conversionDate;
  final String baseCurrency;
  final String convertCurrency;
  final double amount;
  final double result;

  ConversionHistoryEntity({
    this.id,
    required this.conversionDate,
    required this.baseCurrency,
    required this.convertCurrency,
    required this.amount,
    required this.result,
  });

  factory ConversionHistoryEntity.fromJson(Map json) =>
      _$ConversionHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConversionHistoryEntityToJson(this);
}

ConversionHistoryEntity _$ConversionHistoryModelFromJson(Map json) {
  return ConversionHistoryEntity(
    id: json["id"],
    conversionDate: json["conversion_date"],
    baseCurrency: json["base_currency"],
    convertCurrency: json["convert_currency"],
    amount: json["amount"],
    result: json["result"],
  );
}

Map<String, dynamic> _$ConversionHistoryEntityToJson(
    ConversionHistoryEntity conversionEntity) {
  return {
    "conversion_date": conversionEntity.conversionDate,
    "base_currency": conversionEntity.baseCurrency,
    "convert_currency": conversionEntity.convertCurrency,
    "amount": conversionEntity.amount,
    "result": conversionEntity.result,
  };
}
