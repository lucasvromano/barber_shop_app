import 'package:flutter/material.dart';

class ModalResponseMolecule extends StatelessWidget {
  const ModalResponseMolecule(
      {Key? key,
      required this.title,
      this.imagePath,
      required this.description,
      required this.actions})
      : super(key: key);

  final String title;
  final String? imagePath;
  final String description;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(imagePath!),
          ),
          Container(
            padding: const EdgeInsets.only(top: 22),
            width: 350,
            child: Text(description),
          ),
        ],
      ),
      actions: actions,
    );
  }
}
