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
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoginScreen(),
    );
  }
}
