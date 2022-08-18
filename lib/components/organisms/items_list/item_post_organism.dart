import 'package:barber_shop/components/molecules/icon_text_molecule.dart';
import 'package:flutter/material.dart';

class ItemPostOrganism extends StatelessWidget {
  const ItemPostOrganism(
      {Key? key, required this.id, required this.title, required this.body})
      : super(key: key);

  final int id;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 92, 92, 92),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: IconTextMolecule(
              title: id.toString(),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              padding: const EdgeInsets.only(right: 6),
              icon: const Icon(
                Icons.key,
                size: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: IconTextMolecule(
              title: title,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              padding: const EdgeInsets.only(right: 6),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: IconTextMolecule(
              title: body,
              padding: const EdgeInsets.only(right: 6),
            ),
          ),
        ],
      ),
    );
  }
}
