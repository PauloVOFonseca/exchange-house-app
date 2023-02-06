import 'package:exchange_house_app/src/presentation/pages/home/widgets/coin_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                CoinWidget(title: 'Troca de:', coin: 'USD'),
                Icon(Icons.compare_arrows_rounded),
                CoinWidget(title: 'Para:', coin: 'BRL'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CoinWidget(title: 'Valor:', coin: '19.99'),
                const Icon(Icons.arrow_forward),
                Column(
                  children: [
                    const Text('Resultado da conversão:'),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 16),
                      width: MediaQuery.of(context).size.width / 3.5,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.purple),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "500.00",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 120,
              child: TextButton(
                onPressed: () => print('teste'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.purple),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.purple),
                    ),
                  ),
                ),
                child: const Text(
                  'Convert!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple, width: 3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Taxa base de conversão:'),
                  SizedBox(height: 12),
                  Text('1 Real/BRL = 0,197157 Dólar dos Estados Unidos/USD'),
                  SizedBox(height: 12),
                  Text('1 Dólar dos Estados Unidos/USD = 5,0720999 Real/BRL'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
