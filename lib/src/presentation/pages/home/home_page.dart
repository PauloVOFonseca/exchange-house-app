import 'package:exchange_house_app/src/presentation/pages/home/widgets/base_conversion_rate_widget.dart';
import 'package:exchange_house_app/src/presentation/pages/home/widgets/coin_selector_widget.dart';
import 'package:exchange_house_app/src/presentation/pages/home/widgets/exchange_result_widget.dart';
import 'package:exchange_house_app/src/presentation/widgets/custom_button.dart';
import 'package:exchange_house_app/src/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CoinSelectorWidget(title: 'Troca de:', coin: 'USD'),
                Icon(Icons.compare_arrows_rounded),
                CoinSelectorWidget(title: 'Para:', coin: 'BRL'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text('Valor:'),
                    CustomTextField(textController: textController),
                  ],
                ),
                const Icon(Icons.arrow_forward),
                const ExchangeResultWidget(result: 500),
              ],
            ),
            const SizedBox(height: 8),
            CustomButton(
              onPressed: () => print('PRINTT'),
              text: 'Converter',
              widthSize: 120,
            ),
            const SizedBox(height: 24),
            const BaseConversionRateWidget(
              coinBaseName: 'Real/BRL',
              coinBaseValue: 0.2,
              convertedCurrencyName: 'USD',
              convertedCurrencyValue: 5,
            ),
          ],
        ),
      ),
    );
  }
}
