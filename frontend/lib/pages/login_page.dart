import 'package:fit_track/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _visibilityPassword = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.blueAccent,
            fontSize: 40,
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16.0,
              children: [
                TextField(
                  autofocus: true,
                  controller: emailController,
                  decoration: const InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(),
                      hintText: 'example@gmail.com',
                      labelStyle: TextStyle(
                        fontSize: 24,
                      ),
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                      )),
                ),
                TextField(
                  obscuringCharacter: '•',
                  obscureText: !_visibilityPassword ? true : false,
                  controller: passwordController,
                  decoration: InputDecoration(
                      label: const Text(
                        'Senha',
                      ),
                      border: const OutlineInputBorder(),
                      hintText: 'Senha123!',
                      suffixIcon: IconButton(
                        icon: Icon(!_visibilityPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          _visibilityPassword = !_visibilityPassword;
                          setState(() {});
                        },
                      ),
                      labelStyle: const TextStyle(
                        fontSize: 24,
                      ),
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w300,
                      )),
                ),
                Row(
                  spacing: 32.0,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(fixedSize: Size(150, 50)),
                      onPressed: () {},
                      child: const Text('Entrar'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(fixedSize: Size(150, 50)),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()),
                        );
                      },
                      child: const Text('Cadastrar'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
