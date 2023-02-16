import 'package:flutter/material.dart';

class EmptyHistoricWidget extends StatelessWidget {
  const EmptyHistoricWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.sentiment_dissatisfied_sharp, size: 60),
          Text(
            "Você ainda não realizou nenhuma conversão!",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
