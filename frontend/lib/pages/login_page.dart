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
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'FitTrack',
                ),
                const SizedBox(
                  height: 96,
                ),
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
                const SizedBox(
                  height: 16,
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
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Entrar'),
                    ),
                    SizedBox(
                      width: 32,
                    ),
                    ElevatedButton(
                      onPressed: () {},
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
