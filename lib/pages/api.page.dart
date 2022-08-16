import 'package:barber_shop/repositories/post.repository.dart';
import 'package:flutter/material.dart';

import '../models/post.model.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({Key? key}) : super(key: key);

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
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
    void getPosts() {
      // post = postRepository.fetchPost(2);
      posts = postRepository.fetchAllPosts();
      setState(() {
        requesting = true;
      });
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              child: const Text('Busca na API'),
              onPressed: () => getPosts(),
            ),
            if (requesting)
              FutureBuilder<List<Post>>(
                future: posts,
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        padding: const EdgeInsets.all(16),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, int index) {
                            return Column(
                              children: [
                                Text('ID --> ${snapshot.data![index].id}'),
                                Text(
                                    'Title --> ${snapshot.data![index].title}'),
                                Text('Body --> ${snapshot.data![index].body}'),
                                Text(
                                    'UserId --> ${snapshot.data![index].userId}'),
                                const Divider(color: Color(0xF7F7F7FF)),
                              ],
                            );
                          },
                        ),
                        // child: Column(
                        //   children: [
                        //     Text('ID -> ${snapshot.data![0].id}'),
                        //     Text('Title -> ${snapshot.data![0].title}'),
                        //     Text('Body -> ${snapshot.data![0].body}'),
                        //     const Divider(color: Color(0xF7F7F7FF)),
                        //     Text('ID -> ${snapshot.data![1].id}'),
                        //     Text('Title -> ${snapshot.data![1].title}'),
                        //     Text('Body -> ${snapshot.data![1].body}'),
                        //   ],
                        // ),
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
