import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:money_pocket/app/core/ui/constants.dart';
import 'package:money_pocket/app/pages/login%20page/login_page.dart';
import 'package:money_pocket/app/pages/splash/splah_page.dart';

class ExpensesAPP extends StatelessWidget {
  const ExpensesAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Rubik',
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 4,
          shadowColor: ColorsConstants.green,
        ),
      ),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('pt', 'BR'),
      routes: {
        '/': (_) => const SplashPage(),
        '/login': (_) => const LoginPage(),
      },
    );
  }
}
