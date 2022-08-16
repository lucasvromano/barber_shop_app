import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../store/counter.dart';

final counter = Counter(); // Instantiate the store

class MobxPage extends StatelessWidget {
  const MobxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('You have pushed the button this mant times:'),
          Observer(
            builder: (_) => Text(
              '${counter.value}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          ElevatedButton(
            onPressed: () => counter.increment(),
            child: const Text('Incrementar'),
          ),
        ],
      ),
    );
  }
}
