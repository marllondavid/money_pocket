import 'package:flutter/material.dart';
import 'package:money_pocket/app/core/ui/constants.dart';
import 'package:money_pocket/app/pages/login%20page/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var _animationOpacityLogo = 0.0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animationOpacityLogo = 1.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 3),
          curve: Curves.ease,
          opacity: _animationOpacityLogo,
          //utilizo este método para pegar o final da minha transição em curso
          onEnd: () {
            Navigator.of(context).pushAndRemoveUntil(
                //coloco aqui a rota da minha página que irá entrar juntamente com o transition que irá fazer com que eu tenha um fade muito melhor...
                PageRouteBuilder(
                  settings: const RouteSettings(name: 'auth/login'),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const LoginPage();
                  },
                  //foi verificado que estava dando erro na hora da transição da tela de splash para com a tela de login, por isso coloquei este método.
                  transitionsBuilder: (_, animation, __, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
                (route) => false);
          },
          child: Image.asset(
            ImageConstants.imageLogo,
          ),
        ),
      ),
    );
  }
}
