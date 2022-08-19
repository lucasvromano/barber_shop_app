import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../store/post/post_store.dart';

class RegisterPostPage extends StatefulWidget {
  const RegisterPostPage({Key? key}) : super(key: key);

  @override
  State<RegisterPostPage> createState() => _RegisterPostPageState();
}

class _RegisterPostPageState extends State<RegisterPostPage> {
  // of the TextField.
  final title = TextEditingController();
  final body = TextEditingController();
  final userId = TextEditingController();

  final postStore = PostStore();

  @override
  void dispose() {
    title.dispose();
    body.dispose();
    userId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Posts'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 16, 10, 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextField(
                  controller: title,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Título",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextField(
                  controller: body,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Body",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextField(
                  controller: userId,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "User Id",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Observer(
                  name: 'Register POST',
                  builder: (_) {
                    return postStore.isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            child: const Text('Cadastrar'),
                            onPressed: () async {
                              await postStore.registerPost(
                                title.text,
                                body.text,
                                userId.text,
                              );

                              Navigator.pop(context);
                            },
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
