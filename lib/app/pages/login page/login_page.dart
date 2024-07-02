import 'package:flutter/material.dart';
import 'package:money_pocket/app/core/ui/constants.dart';
import 'package:money_pocket/app/core/ui/widgets/pocket_field.dart';
import 'package:money_pocket/app/pages/forget%20password/forget_password.dart';
import 'package:money_pocket/app/pages/home%20page/home_page.dart';
import 'package:money_pocket/app/pages/sing%20up/sing_up_page.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
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
                  fit: BoxFit.fill,
                ),
                const Text(
                  'Faça o seu login',
                  style: TextStyle(
                    color: ColorsConstants.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                PocketField(
                  preffixIcon: const Icon(Icons.person_2_outlined),
                  label: 'E-mail',
                  controller: _emailController,
                  validator: Validatorless.required('E-mail obrigatório'),
                ),
                const SizedBox(
                  height: 25,
                ),
                PocketField(
                  preffixIcon: const Icon(Icons.lock_outline_rounded),
                  label: 'Senha',
                  controller: _passwordController,
                  obscureText: true,
                  validator: Validatorless.required('Preencha a senha'),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgetPassword(),
                        ),
                      );
                    },
                    child: const Text(
                      'Esqueceu sua senha?',
                      style: TextStyle(
                        color: ColorsConstants.green,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
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
                          builder: (context) => const HomePage(),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Entrar',
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
                    const Text('Não possui uma conta?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SingUpPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Cadastre-se',
                        style: TextStyle(
                          color: ColorsConstants.green,
                          fontSize: 14,
                        ),
                      ),
                    ),
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
