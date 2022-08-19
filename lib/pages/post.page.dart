import 'package:barber_shop/store/post/post_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../components/organisms/items_list/item_post_organism.dart';

final postStore = PostStore();

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ElevatedButton(
                child: const Text('Busca na API'),
                onPressed: () => postStore.getAllItems(),
              ),
            ),
            Observer(
              name: 'List Posts',
              builder: (_) {
                return postStore.isLoading && postStore.posts.isEmpty
                    ? const CircularProgressIndicator()
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: postStore.posts.length,
                            itemBuilder: (_, int index) {
                              return ItemPostOrganism(
                                id: postStore.posts[index].id,
                                title: postStore.posts[index].title,
                                body: postStore.posts[index].body,
                              );
                            },
                          ),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
