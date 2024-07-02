import 'package:flutter/material.dart';
import 'package:money_pocket/app/core/ui/constants.dart';
import 'package:money_pocket/app/core/ui/widgets/pocket_field.dart';
import 'package:money_pocket/app/pages/login%20page/login_page.dart';
import 'package:validatorless/validatorless.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final defaultInputBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(25),
    ),
    borderSide: BorderSide(
      color: Colors.black,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.asset(
                  ImageConstants.imageLogo,
                  fit: BoxFit.contain,
                ),
                const Text(
                  'Digite os seus dados para se cadastrar',
                  style: TextStyle(
                    color: ColorsConstants.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                PocketField(
                  preffixIcon: const Icon(Icons.person_2_outlined),
                  label: 'Nome Completo',
                  controller: _nameController,
                  validator: Validatorless.required('Nome obrigatório'),
                ),
                const SizedBox(
                  height: 20,
                ),
                PocketField(
                  preffixIcon: const Icon(Icons.person_2_outlined),
                  label: 'Endereço de E-mail',
                  controller: _emailController,
                  validator: Validatorless.required('E-mail obrigatório'),
                ),
                const SizedBox(
                  height: 20,
                ),
                PocketField(
                  preffixIcon: const Icon(Icons.lock_outline_rounded),
                  label: 'Senha',
                  controller: _passwordController,
                  obscureText: true,
                  validator: Validatorless.required('Preencha a senha'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsConstants.green,
                    minimumSize: const Size(250, 48),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Criar Conta',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Já possui uma conta?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Faça login',
                        style: TextStyle(
                          color: ColorsConstants.green,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
