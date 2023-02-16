import 'package:exchange_house_app/src/domain/entities/conversion_history/conversion_history_entity.dart';
import 'package:exchange_house_app/src/presentation/pages/historic/historic_controller.dart';
import 'package:exchange_house_app/src/presentation/pages/historic/widgets/empty_historic_widget.dart';
import 'package:exchange_house_app/src/presentation/pages/historic/widgets/historic_card_widget.dart';
import 'package:exchange_house_app/src/presentation/widgets/error_message_widget.dart';
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
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, index) {
                    return HistoricCardWidget(
                      date: snapshot.data![index].conversionDate,
                      baseCoin: snapshot.data![index].baseCurrency,
                      convertedCoin: snapshot.data![index].convertCurrency,
                      amount: snapshot.data![index].amount,
                      result: snapshot.data![index].result,
                    );
                  }),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data!.isEmpty) {
              return const EmptyHistoricWidget();
            }
            return const ErrorMessageWidget();
          }),
        ),
      ),
    );
  }
}
