import 'package:exchange_house_app/src/application/utils/coins.dart';
import 'package:flutter/material.dart';

class CoinListWidget extends StatelessWidget {
  const CoinListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('Selecione uma moeda'),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: COINS_MOCK.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int count) {
                    return Text(
                        '${COINS_MOCK.keys.elementAt(count)} - ${COINS_MOCK.values.elementAt(count)}');
                  },
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
