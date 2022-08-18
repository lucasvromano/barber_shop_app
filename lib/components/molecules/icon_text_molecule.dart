import 'package:barber_shop/components/atoms/text_atom.dart';
import 'package:flutter/material.dart';

class IconTextMolecule extends StatelessWidget {
  const IconTextMolecule({
    Key? key,
    required this.title,
    this.fontSize,
    this.fontWeight,
    this.icon,
    this.padding,
  }) : super(key: key);

  final Icon? icon;
  final EdgeInsetsGeometry? padding;

  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: padding,
          child: icon,
        ),
        Flexible(
          child: TextAtom(
            title: title,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ],
    );
  }
}
