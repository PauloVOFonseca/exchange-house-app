import 'package:exchange_house_app/src/presentation/pages/historic/widgets/historic_card_widget.dart';
import 'package:flutter/material.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({super.key});

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversion History'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            HistoricCardWidget(
              date: DateTime.now(),
              baseCoin: 'USD',
              convertedCoin: 'BRL',
              amount: 5.2,
              result: 25.05,
            ),
            const SizedBox(height: 10),
            HistoricCardWidget(
              date: DateTime.now(),
              baseCoin: 'BRL',
              convertedCoin: 'EUR',
              amount: 30.2,
              result: 6.17,
            ),
            const SizedBox(height: 10),
            HistoricCardWidget(
              date: DateTime.now(),
              baseCoin: 'BRL',
              convertedCoin: 'KRW',
              amount: 100000,
              result: 300000003,
            ),
          ],
        ),
      ),
    );
  }
}
