import 'package:barber_shop/components/molecules/icon_text_molecule.dart';
import 'package:flutter/material.dart';

class ItemScheduleOrganism extends StatelessWidget {
  const ItemScheduleOrganism({
    Key? key,
    required this.customer,
    required this.services,
    required this.employee,
    required this.dateHour,
    required this.price,
  }) : super(key: key);

  final String customer;
  final String services;
  final String employee;
  final String dateHour;
  final String price;

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
              title: customer,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              padding: const EdgeInsets.only(right: 6),
              icon: const Icon(
                Icons.person,
                size: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Column(
              children: [
                IconTextMolecule(
                  title: services,
                ),
                IconTextMolecule(
                  title: employee,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: IconTextMolecule(
                    title: dateHour,
                    padding: const EdgeInsets.only(right: 6),
                    fontSize: 12,
                    icon: const Icon(Icons.watch_later, size: 16),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: IconTextMolecule(
                    title: price,
                    padding: const EdgeInsets.only(left: 6),
                    fontSize: 12,
                    icon: const Icon(Icons.attach_money, size: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
