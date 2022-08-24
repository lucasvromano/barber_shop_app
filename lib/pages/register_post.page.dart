import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../components/atoms/text_field_atom.dart';
import '../components/molecules/modals/modal_response_molecule.dart';
import '../store/post/post_store.dart';

class RegisterPostPage extends StatefulWidget {
  const RegisterPostPage({Key? key}) : super(key: key);

  @override
  State<RegisterPostPage> createState() => _RegisterPostPageState();
}

class _RegisterPostPageState extends State<RegisterPostPage> {
  final title = TextEditingController();
  final body = TextEditingController();
  final userId = TextEditingController();
  final postStore = PostStore();

  registerPost(context) {
    if (!postStore.isLoading) {
      return ElevatedButton(
        child: const Text('Cadastrar'),
        onPressed: () async {
          try {
            await postStore.registerPost(
              title.text,
              body.text,
              userId.text,
            );

            showDialog<String>(
              context: context,
              builder: (BuildContext context) => ModalResponseMolecule(
                title: 'Cadastro realizado com sucesso!',
                imagePath: 'lib/assets/icon/ic-ok.png',
                description:
                    'Seu cadastro foi realizado com sucesso! Você deseja pernanecer nesta tela ou voltar para a anterior?',
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Permanecer'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      '/home',
                    ),
                    child: const Text('Voltar'),
                  ),
                ],
              ),
            );
          } catch (err) {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => ModalResponseMolecule(
                title: 'Algo deu errado!',
                imagePath: 'lib/assets/icon/ic-cancel.png',
                description: 'Erro $err',
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Fechar'),
                  ),
                ],
              ),
            );
          }
          postStore.isLoading = false;
        },
      );
    }

    return const CircularProgressIndicator();
  }

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
                child: TextFieldAtom(
                  controller: title,
                  labelText: "Título",
                  obscureText: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextFieldAtom(
                  controller: body,
                  labelText: "Body",
                  obscureText: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextFieldAtom(
                  controller: userId,
                  keyboardType: TextInputType.number,
                  labelText: "User ID",
                  obscureText: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Observer(
                  name: 'Register POST',
                  builder: (_) => registerPost(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
