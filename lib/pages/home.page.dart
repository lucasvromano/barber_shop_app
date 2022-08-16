import 'package:barber_shop/components/organisms/item_list_organism.dart';
import 'package:barber_shop/repositories/post.repository.dart';
import 'package:flutter/material.dart';

import '../models/post.model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final List<Map<String, dynamic>> items = [
  //   {
  //     'customer': 'José Pedro da Silva',
  //     'services': 'Corte de cabelo e corte de barba',
  //     'employee': 'Cleiton da Silva',
  //     'dateHour': '13/09/22 - 16:55',
  //     'price': '50,00',
  //   },
  //   {
  //     'customer': 'Pedro da Silva',
  //     'services': 'Corte de cabelo',
  //     'employee': 'Jorge Oliveira',
  //     'dateHour': '13/09/22 - 12:55',
  //     'price': '35,00',
  //   }
  // ];

  var requesting = false;
  late PostRepository postRepository;
  late Future<Post> post;
  late Future<List<Post>> posts;

  @override
  void initState() {
    super.initState();
    postRepository = PostRepository();
  }

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                post = postRepository.fetchPost(2);
                setState(() {
                  requesting = true;
                });
              },
              child: const Text('Aqui'),
            ),
            if (requesting)
              FutureBuilder<Post>(
                future: post,
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text('ID -> ${snapshot.data!.id}'),
                          Text('Title -> ${snapshot.data!.title}'),
                          Text('Body -> ${snapshot.data!.body}'),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),
          ],
        ),

        // child: ListView.builder(
        //   itemCount: items.length,
        //   itemBuilder: (_, int index) {
        //     return ItemListOrganism(
        //       customer: items[index]['customer'],
        //       services: items[index]['services'],
        //       employee: items[index]['employee'],
        //       dateHour: items[index]['dateHour'],
        //       price: items[index]['price'],
        //     );
        //   },
        // ),
      ),
    );
  }
}

class DioClient {}
