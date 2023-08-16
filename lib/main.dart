import 'package:etco/authentication/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EtcoSeller());
}

class EtcoSeller extends StatelessWidget {
  const EtcoSeller({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ETCO Seller',
      theme: ThemeData(
        primaryColor: const Color(0xff03592C),
        hintColor: const Color(0xff808080),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
