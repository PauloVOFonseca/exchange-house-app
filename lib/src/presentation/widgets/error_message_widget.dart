import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(Icons.error_outline, color: Colors.red, size: 30),
        Text(
          'Ocorreu alguma falha na conversão, tente novamente mais tarde.',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}