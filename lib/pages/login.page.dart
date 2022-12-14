import 'package:barber_shop/assets/colors.dart';
import 'package:barber_shop/components/atoms/text_field_atom.dart';
import 'package:barber_shop/pages/home.page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  final String userName = 'Usuário';
  final String password = 'Senha';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackground,
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: CircleAvatar(
                    radius: 110,
                    backgroundImage:
                        AssetImage('lib/assets/icon/ic_launcher.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextFieldAtom(
                    labelText: userName,
                    obscureText: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextFieldAtom(
                    labelText: password,
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.orange[600]),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      child: const Text('Entrar'),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(primary: Colors.orange[600]),
                  onPressed: () {},
                  child: const Text('Esqueci minha senha'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
