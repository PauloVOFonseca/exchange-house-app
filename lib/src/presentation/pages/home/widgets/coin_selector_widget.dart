import 'package:exchange_house_app/src/application/utils/coins.dart';
import 'package:exchange_house_app/src/presentation/pages/home/widgets/coin_list_widget.dart';
import 'package:flutter/material.dart';

class CoinSelectorWidget extends StatefulWidget {
  final String title;
  final String coin;
  const CoinSelectorWidget(
      {super.key, required this.title, required this.coin});

  @override
  State<CoinSelectorWidget> createState() => _CoinSelectorWidgetState();
}

class _CoinSelectorWidgetState extends State<CoinSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      width: MediaQuery.of(context).size.width / 3.5,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.purple),
        ),
      ),
      child: Column(
        children: [
          Text(widget.title),
          TextButton(
            onPressed: () => showModalBottomSheet<void>(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              builder: (BuildContext context) {
                return const CoinListWidget();
              },
            ),
            child: Text(
              widget.coin,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
