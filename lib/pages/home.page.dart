import 'package:barber_shop/components/organisms/item_list_organism.dart';
import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Agendamentos'),
//         automaticallyImplyLeading: false,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.business),
//             label: 'Business',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             label: 'School',
//           ),
//         ],
//         // currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         // onTap: _onItemTapped,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8),
//         child: ListView(
//           children: const <Widget>[
//             ItemListOrganism(
//               customer: 'José Pedro da Silva',
//               services: 'Corte de cabelo e corte de barba',
//               employee: 'Cleiton da Silva',
//               dateHour: '13/09/22 - 16:55',
//               price: '50,00',
//             ),
//             ItemListOrganism(
//               customer: 'Pedro da Silva',
//               services: 'Corte de cabelo',
//               employee: 'Jorge Oliveira',
//               dateHour: '13/09/22 - 12:55',
//               price: '35,00',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    debugPrint(items.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendamentos'),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        // currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        // onTap: _onItemTapped,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (_, int index) {
            return ItemListOrganism(
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
