import 'package:exchange_house_app/src/presentation/pages/home/home_controller.dart';
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
  final HomeController pageController = HomeController();

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
              children: [
                CoinSelectorWidget(
                  title: 'Troca de:',
                  coin: pageController.coinBase,
                  onPressed: (newCoinValue) {
                    pageController.changeCoinBase(newCoinValue);
                    setState(() {});
                  },
                ),
                IconButton(
                  onPressed: () {
                    pageController.switchCoins();
                    setState(() {});
                  },
                  icon: const Icon(Icons.compare_arrows_rounded),
                ),
                CoinSelectorWidget(
                  title: 'Para:',
                  coin: pageController.coinToConvert,
                  onPressed: (newCoinValue) {
                    pageController.changeCoinToConvert(newCoinValue);
                    setState(() {});
                  },
                ),
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
                ExchangeResultWidget(
                  result: pageController.convertedCoinValue ?? 0,
                ),
              ],
            ),
            const SizedBox(height: 8),
            CustomButton(
              onPressed: () =>
                  pageController.makeCurrencyExchange(textController.text),
              text: 'Converter',
              widthSize: 120,
            ),
            const SizedBox(height: 24),
            Visibility(
              visible: pageController.convertedCoinValue == null ? false : true,
              child: BaseConversionRateWidget(
                coinBaseName: pageController.coinBase,
                coinBaseValue: pageController.coinBaseValue,
                convertedCurrencyName: pageController.coinToConvert,
                convertedCurrencyValue:
                    pageController.convertedValueToBaseValue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
