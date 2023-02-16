import 'package:exchange_house_app/src/domain/entities/conversion_history/conversion_history_entity.dart';
import 'package:exchange_house_app/src/presentation/pages/historic/historic_controller.dart';
import 'package:exchange_house_app/src/presentation/pages/historic/widgets/historic_card_widget.dart';
import 'package:flutter/material.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({super.key});

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  final HistoricController pageController = HistoricController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversion History'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: FutureBuilder<List<ConversionHistoryEntity>>(
          future: pageController.getAllConversions(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data!.isNotEmpty) {
              return Column(
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
              );
            } 
            return Container();
          }),
        ),
      ),
    );
  }
}
