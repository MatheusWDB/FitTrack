import 'package:fit_track/pages/login_page.dart';
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

  Map<String, String?> errorTexts = {
    'errorEmail': null,
    'errorName': null,
    'errorSurname': null,
    'errorPassword': null,
    'errorConfirmPassword': null,
  };

  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.fromLTRB(0, 24, 0, 0),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cadastro'),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.blueAccent,
            fontSize: 40,
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16.0,
              children: [
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  autofocus: true,
                  controller: emailController,
                  onChanged: (value) => clearError('errorEmail'),
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    border: const OutlineInputBorder(),
                    hintText: 'example@gmail.com',
                    errorText: errorTexts['errorEmail'],
                    labelStyle: const TextStyle(
                      fontSize: 24,
                    ),
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                    errorStyle: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  onChanged: (value) => clearError('errorName'),
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                    hintText: 'Enzo',
                    errorText: errorTexts['errorName'],
                    labelStyle: TextStyle(
                      fontSize: 24,
                    ),
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                    errorStyle: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.name,
                  controller: surnameController,
                  onChanged: (value) => clearError('errorSurname'),
                  decoration: InputDecoration(
                    labelText: 'Sobrenome',
                    border: OutlineInputBorder(),
                    hintText: 'Santos',
                    errorText: errorTexts['errorSurname'],
                    labelStyle: TextStyle(
                      fontSize: 24,
                    ),
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                    errorStyle: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                TextField(
                  obscuringCharacter: '•',
                  obscureText: !_visibilityPassword ? true : false,
                  controller: passwordController,
                  onChanged: (value) => clearError('errorPassword'),
                  decoration: InputDecoration(
                    label: const Text(
                      'Senha',
                    ),
                    border: const OutlineInputBorder(),
                    hintText: 'Senha123!',
                    errorText: errorTexts['errorPassword'],
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
                    ),
                    errorStyle: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                TextField(
                  obscuringCharacter: '•',
                  obscureText: !_visibilityConfirmPassword ? true : false,
                  controller: confirmPasswordController,
                  onChanged: (value) => clearError('errorConfirmPassword'),
                  decoration: InputDecoration(
                    label: const Text(
                      'Confirme a Senha',
                    ),
                    border: const OutlineInputBorder(),
                    hintText: 'Senha123!',
                    errorText: errorTexts['errorConfirmPassword'],
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
                    ),
                    errorStyle: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                Row(
                  spacing: 32.0,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(fixedSize: Size(150, 50)),
                      onPressed: verification,
                      child: const Text('Cadastrar'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(fixedSize: Size(150, 50)),
                      onPressed: () {
                        Navigator.of(context).pop(
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text('Voltar'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void verification() {
    final Map<String, TextEditingController> fields = {
      'errorEmail': emailController,
      'errorName': nameController,
      'errorSurname': surnameController,
      'errorPassword': passwordController,
      'errorConfirmPassword': confirmPasswordController,
    };

    bool hasErrors = false;

    fields.forEach((key, controller) {
      if (controller.text.isEmpty) {
        setState(() {
          errorTexts[key] = 'Campo obrigatório!';
        });
        hasErrors = true;
      }
    });

    if (hasErrors) return;

    // Lógica de validação de e-mail
    print(
        'AQUIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII ${emailRegex.hasMatch(emailController.text)}');
    if (!emailRegex.hasMatch(emailController.text)) {
      setState(() {
        errorTexts['errorEmail'] = 'Digite um e-mail válido.';
      });
      return;
    }
    if (passwordController.text.length < 8) {
      setState(() {
        errorTexts['errorPassword'] =
            'A senha deve conter pelo menos 8 caracteres.';
      });
      return;
    }
    if (passwordController.text != confirmPasswordController.text) {
      setState(() {
        errorTexts['errorPassword'] = 'As senhas não coincidem.';
        errorTexts['errorConfirmPassword'] = 'As senhas não coincidem.';
      });
      return;
    }

    return Navigator.of(context).pop(
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  void clearError(String? errorText) {
    setState(() {
      if (errorTexts[errorText] != null) {
        errorTexts[errorText!] = null;
        if (errorText == 'errorConfirmPassword') {
          errorTexts['errorPassword'] != null
              ? errorTexts['errorPassword'] = null
              : null;
        }
      }
    });
  }
}
