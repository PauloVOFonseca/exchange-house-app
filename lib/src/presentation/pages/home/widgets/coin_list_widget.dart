import 'package:exchange_house_app/src/application/utils/coins.dart';
import 'package:flutter/material.dart';

class CoinListWidget extends StatelessWidget {
  final String? currentCoinSelected;
  final Function(String) onPressed;
  const CoinListWidget({
    super.key,
    required this.onPressed,
    this.currentCoinSelected,
  });

  bool isCoinSelected(int position) {
    return COINS_MOCK.keys.elementAt(position) == currentCoinSelected;
  }

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
                    return TextButton(
                      onPressed: () {
                        onPressed(COINS_MOCK.keys.elementAt(count));
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(50, 30),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.centerLeft,
                      ),
                      child: Text(
                        '${COINS_MOCK.keys.elementAt(count)} - ${COINS_MOCK.values.elementAt(count)}',
                        style: TextStyle(
                          color: isCoinSelected(count)
                              ? Colors.purple
                              : Colors.black,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
