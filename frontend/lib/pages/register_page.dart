import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _visibilityPassword = false;
  bool _visibilityConfirmPassword = false;

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
                  keyboardType: TextInputType.emailAddress,
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
                  autofocus: true,
                  controller: nameController,
                  decoration: const InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                      hintText: 'Enzo',
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
                  autofocus: true,
                  controller: surnameController,
                  decoration: const InputDecoration(
                      labelText: 'Sobrenome',
                      border: OutlineInputBorder(),
                      hintText: 'Santos',
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
                TextField(
                  obscuringCharacter: '•',
                  obscureText: !_visibilityConfirmPassword ? true : false,
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                      label: const Text(
                        'Confirme a Senha',
                      ),
                      border: const OutlineInputBorder(),
                      hintText: 'Senha123!',
                      suffixIcon: IconButton(
                        icon: Icon(!_visibilityConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          _visibilityConfirmPassword =
                              !_visibilityConfirmPassword;
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
                      child: const Text('Cadastrar'),
                    ),
                    SizedBox(
                      width: 32,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Voltar'),
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

  void verification() {
    if (emailController == true) {}
    if (passwordController.toString().length < 8) {}

    if (passwordController != confirmPasswordController) {}
  }
}
