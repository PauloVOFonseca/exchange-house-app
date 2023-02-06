import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double? widthSize;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.widthSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthSize ?? MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: Colors.purple),
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
