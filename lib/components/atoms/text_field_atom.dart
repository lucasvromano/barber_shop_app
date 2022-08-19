import 'package:flutter/material.dart';

class TextFieldAtom extends StatelessWidget {
  const TextFieldAtom(
      {Key? key,
      required this.labelText,
      this.keyboardType,
      this.controller,
      required this.obscureText})
      : super(key: key);

  final String labelText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
    );
  }
}
