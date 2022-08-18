import 'package:barber_shop/store/post/post_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../components/organisms/items_list/item_post_organism.dart';

final api = PostStore();

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
                onPressed: () => api.getAllItems(),
              ),
            ),
            Observer(
              name: 'Observer API',
              builder: (_) {
                return api.isLoading && api.apis.isEmpty
                    ? const CircularProgressIndicator()
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: api.apis.length,
                            itemBuilder: (_, int index) {
                              return ItemPostOrganism(
                                id: api.apis[index].id,
                                title: api.apis[index].title,
                                body: api.apis[index].body,
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
