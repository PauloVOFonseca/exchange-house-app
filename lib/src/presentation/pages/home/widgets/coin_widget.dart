import 'package:flutter/material.dart';

class CoinWidget extends StatefulWidget {
  final String coin;
  const CoinWidget({super.key, required this.coin});

  @override
  State<CoinWidget> createState() => _CoinWidgetState();
}

class _CoinWidgetState extends State<CoinWidget> {
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
      child: TextButton(
          onPressed: () => print('kkk'),
          child: Text(
            widget.coin,
            style: const TextStyle(color: Colors.black),
          )),
    );
  }
}
