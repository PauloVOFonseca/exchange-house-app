import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textController;
  const CustomTextField({super.key, required this.textController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: textController,
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.purple),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.purple),
          ),
        ),
      ),
    );
  }
}
