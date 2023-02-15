import 'package:exchange_house_app/src/application/utils/coins.dart';
import 'package:flutter/material.dart';

class HistoricCardWidget extends StatelessWidget {
  final DateTime date;
  final String baseCoin;
  final String convertedCoin;
  final double amount;
  final double result;
  
  const HistoricCardWidget({
    super.key,
    required this.date,
    required this.baseCoin,
    required this.convertedCoin,
    required this.amount,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.purple[200],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(date.toString()),
                const Icon(Icons.attach_money, color: Colors.yellow),
              ],
            ),
            Text('De: $baseCoin | ${COINS_MOCK[baseCoin]}'),
            Text('Para: $convertedCoin | ${COINS_MOCK[convertedCoin]}'),
            Row(
              children: [
                Text('$amount $baseCoin'),
                const SizedBox(width: 12),
                const Icon(Icons.arrow_forward_rounded),
                const SizedBox(width: 12),
                Text('$result $convertedCoin'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
