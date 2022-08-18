import 'package:barber_shop/repositories/api.repository.dart';
import 'package:flutter/material.dart';
import '../components/organisms/items_list/item_schedule_organism.dart';
import '../models/post.model.dart';
import '../repositories/api.repository.dart';

class SchedulesPage extends StatefulWidget {
  const SchedulesPage({Key? key}) : super(key: key);

  @override
  State<SchedulesPage> createState() => _SchedulesPageState();
}

class _SchedulesPageState extends State<SchedulesPage> {
  final List<Map<String, dynamic>> items = [
    {
      'customer': 'José Pedro da Silva',
      'services': 'Corte de cabelo e corte de barba',
      'employee': 'Cleiton da Silva',
      'dateHour': '13/09/22 - 16:55',
      'price': '50,00',
    },
    {
      'customer': 'Pedro da Silva',
      'services': 'Corte de cabelo',
      'employee': 'Jorge Oliveira',
      'dateHour': '13/09/22 - 12:55',
      'price': '35,00',
    }
  ];

  var requesting = false;
  late ApiRepository apiRepository;
  late Future<PostModel> api;
  late Future<List<PostModel>> apis;

  @override
  void initState() {
    super.initState();
    apiRepository = ApiRepository();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (_, int index) {
            return ItemScheduleOrganism(
              customer: items[index]['customer'],
              services: items[index]['services'],
              employee: items[index]['employee'],
              dateHour: items[index]['dateHour'],
              price: items[index]['price'],
            );
          },
        ),
      ),
    );
  }
}
