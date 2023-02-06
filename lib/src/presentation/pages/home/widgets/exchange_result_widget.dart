import 'package:flutter/material.dart';

class ExchangeResultWidget extends StatelessWidget {
  final double result;
  const ExchangeResultWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Resultado da conversão:'),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 2,
            vertical: 15,
          ),
          width: MediaQuery.of(context).size.width / 3.5,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.purple),
            ),
          ),
          child: Center(
            child: Text(
              result.toString(),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
