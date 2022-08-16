import 'package:barber_shop/repositories/post.repository.dart';
import 'package:flutter/material.dart';

import '../models/post.model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              child: const Text('Busca na API'),
              onPressed: () {
                // post = postRepository.fetchPost(2);
                posts = postRepository.fetchAllPosts();
                setState(() {
                  requesting = true;
                });
              },
            ),
            if (requesting)
              FutureBuilder<List<Post>>(
                future: posts,
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text('ID -> ${snapshot.data![0].id}'),
                          Text('Title -> ${snapshot.data![0].title}'),
                          Text('Body -> ${snapshot.data![0].body}'),
                          const Divider(color: Color(0xF7F7F7FF)),
                          Text('ID -> ${snapshot.data![1].id}'),
                          Text('Title -> ${snapshot.data![1].title}'),
                          Text('Body -> ${snapshot.data![1].body}'),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),

            // FutureBuilder<Post>(
            //   future: post,
            //   builder: (_, snapshot) {
            //     if (snapshot.hasData) {
            //       return Padding(
            //         padding: const EdgeInsets.all(16),
            //         child: Column(
            //           children: [
            //             Text('ID -> ${snapshot.data!.id}'),
            //             Text('Title -> ${snapshot.data!.title}'),
            //             Text('Body -> ${snapshot.data!.body}'),
            //           ],
            //         ),
            //       );
            //     } else if (snapshot.hasError) {
            //       return Text('${snapshot.error}');
            //     }
            //     return const CircularProgressIndicator();
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
