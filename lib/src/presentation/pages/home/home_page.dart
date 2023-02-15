import 'package:exchange_house_app/src/presentation/pages/historic/historic_page.dart';
import 'package:exchange_house_app/src/presentation/pages/home/home_controller.dart';
import 'package:exchange_house_app/src/presentation/pages/home/widgets/base_conversion_rate_widget.dart';
import 'package:exchange_house_app/src/presentation/pages/home/widgets/coin_selector_widget.dart';
import 'package:exchange_house_app/src/presentation/pages/home/widgets/exchange_result_widget.dart';
import 'package:exchange_house_app/src/presentation/widgets/custom_button.dart';
import 'package:exchange_house_app/src/presentation/widgets/custom_text_field.dart';
import 'package:exchange_house_app/src/presentation/widgets/error_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textController = TextEditingController();
  late HomeController pageController;

  @override
  Widget build(BuildContext context) {
    pageController = context.watch<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const HistoricPage(),
              ),
            ),
            icon: const Icon(Icons.history_rounded),
          ),
        ],
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
                  },
                ),
                IconButton(
                  onPressed: () {
                    pageController.switchCoins();
                  },
                  icon: const Icon(Icons.compare_arrows_rounded),
                ),
                CoinSelectorWidget(
                  title: 'Para:',
                  coin: pageController.coinToConvert,
                  onPressed: (newCoinValue) {
                    pageController.changeCoinToConvert(newCoinValue);
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
              onPressed: () async {
                FocusScope.of(context).unfocus();
                await pageController.makeCurrencyExchange(textController.text);
              },
              text: 'Converter',
              widthSize: 120,
            ),
            const SizedBox(height: 24),
            if (pageController.pageState == HomePageState.loading)
              const CircularProgressIndicator(),
            if (pageController.pageState == HomePageState.loaded)
              BaseConversionRateWidget(
                coinBaseName: pageController.coinBase,
                coinBaseValue: pageController.coinBaseComparedToConverted,
                convertedCurrencyName: pageController.coinToConvert,
                convertedCurrencyValue:
                    pageController.convertedCoinComparedToBase,
              ),
            if (pageController.pageState == HomePageState.error)
              const ErrorMessageWidget(),
          ],
        ),
      ),
    );
  }
}
