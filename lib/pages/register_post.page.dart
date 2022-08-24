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
    final modal = ModalTeste();

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

            modal.setTitle('Cadastro realizado com sucesso!');
            modal.setImagePath('lib/assets/icon/ic-ok.png');
            modal.setDescription(
                'Seu cadastro foi realizado com sucesso! Você deseja pernanecer nesta tela ou voltar para a anterior?');
            modal.setActions(
              [
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
            );

            showDialog<String>(
              context: context,
              builder: (BuildContext context) => modal.buildModal(),
            );
          } catch (e) {
            var modal = ModalTeste();
            modal.setTitle('Algo deu errado!');
            modal.setImagePath('lib/assets/icon/ic-cancel.png');
            modal.setDescription('Erro: $e');
            modal.setActions(
              [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Fechar'),
                ),
              ],
            );
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => modal.buildModal(),
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

class ModalTeste {
  String title = '';
  String imagePath = '';
  String description = '';
  List<Widget> actions = [];

  Object teste = {"teste": ""};

  get getTitle => title;
  void setTitle(String _title) => title = _title;

  get getImagePath => imagePath;
  void setImagePath(String _imagePath) => imagePath = _imagePath;

  get getDescription => description;
  void setDescription(String _description) => description = _description;

  get getActions => actions;
  void setActions(List<Widget> _actions) => actions = _actions;

  Widget buildModal() {
    return ModalResponseMolecule(
      title: title,
      imagePath: imagePath,
      description: description,
      actions: actions,
    );
  }
}
