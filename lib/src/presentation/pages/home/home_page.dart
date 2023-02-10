import 'package:exchange_house_app/src/presentation/pages/home/home_controller.dart';
import 'package:exchange_house_app/src/presentation/pages/home/widgets/base_conversion_rate_widget.dart';
import 'package:exchange_house_app/src/presentation/pages/home/widgets/coin_selector_widget.dart';
import 'package:exchange_house_app/src/presentation/pages/home/widgets/exchange_result_widget.dart';
import 'package:exchange_house_app/src/presentation/widgets/custom_button.dart';
import 'package:exchange_house_app/src/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                  coin: context.watch<HomeController>().coinBase,
                  onPressed: (newCoinValue) {
                    context.read<HomeController>().changeCoinBase(newCoinValue);
                  },
                ),
                IconButton(
                  onPressed: () {
                    context.read<HomeController>().switchCoins();
                  },
                  icon: const Icon(Icons.compare_arrows_rounded),
                ),
                CoinSelectorWidget(
                  title: 'Para:',
                  coin: context.watch<HomeController>().coinToConvert,
                  onPressed: (newCoinValue) {
                    context
                        .read<HomeController>()
                        .changeCoinToConvert(newCoinValue);
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
                  result:
                      context.watch<HomeController>().convertedCoinValue ?? 0,
                ),
              ],
            ),
            const SizedBox(height: 8),
            CustomButton(
              onPressed: () async {
                FocusScope.of(context).unfocus();
                await context
                    .read<HomeController>()
                    .makeCurrencyExchange(textController.text);
              },
              text: 'Converter',
              widthSize: 120,
            ),
            const SizedBox(height: 24),
            if (context.watch<HomeController>().pageState ==
                HomePageState.loading)
              const CircularProgressIndicator(),
            if (context.watch<HomeController>().pageState ==
                HomePageState.loaded)
              BaseConversionRateWidget(
                coinBaseName: context.watch<HomeController>().coinBase,
                coinBaseValue:
                    context.watch<HomeController>().coinBaseComparedToConverted,
                convertedCurrencyName:
                    context.watch<HomeController>().coinToConvert,
                convertedCurrencyValue:
                    context.watch<HomeController>().convertedCoinComparedToBase,
              ),
          ],
        ),
      ),
    );
  }
}
