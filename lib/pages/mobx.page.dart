import 'package:flutter/cupertino.dart';

class MobxPage extends StatefulWidget {
  const MobxPage({Key? key}) : super(key: key);

  @override
  State<MobxPage> createState() => _MobxPageState();
}

class _MobxPageState extends State<MobxPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      child: const Text('Teste'),
    );
  }
}
