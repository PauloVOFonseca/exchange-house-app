import 'package:flutter/material.dart';

class BaseConversionRateWidget extends StatelessWidget {
  final String coinBaseName;
  final double? coinBaseValue;
  final String convertedCurrencyName;
  final double? convertedCurrencyValue;
  const BaseConversionRateWidget({
    super.key,
    required this.coinBaseName,
    this.coinBaseValue,
    required this.convertedCurrencyName,
    this.convertedCurrencyValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple, width: 3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Taxa base de conversão:'),
          const SizedBox(height: 12),
          Text('1 $coinBaseName = $coinBaseValue $convertedCurrencyName'),
          const SizedBox(height: 12),
          Text(
              '1 $convertedCurrencyName = $convertedCurrencyValue $coinBaseName'),
        ],
      ),
    );
  }
}
