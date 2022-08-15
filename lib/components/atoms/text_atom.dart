import 'package:flutter/material.dart';

class TextAtom extends StatelessWidget {
  const TextAtom(
      {Key? key, required this.title, this.fontSize, this.fontWeight})
      : super(key: key);

  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
