import 'package:flutter/material.dart';
import 'package:keto_diet/screens/intro_screen.dart';
import 'package:keto_diet/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Keto Diet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
            headline1: const TextStyle(
                fontSize: 10, color: Colors.amber, fontWeight: FontWeight.bold),
            headline2: TextStyle(
                fontSize: 22,
                color: Colors.black.withAlpha(160),
                fontWeight: FontWeight.bold),
            headline3:
                TextStyle(fontSize: 22, color: Colors.white.withAlpha(160)),
            headline4: const TextStyle(fontSize: 16)),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color.fromARGB(218, 223, 216, 223),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: (Colors.grey[300])!),
            borderRadius: BorderRadius.circular(25),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: (Colors.grey[300])!),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: (Colors.grey[300])!),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      initialRoute: 'intro',
      routes: {
        'login': (context) => const LoginScreen(authType: AuthType.login),
        'register': (context) => const LoginScreen(authType: AuthType.register),
        'intro': (context) => const IntroScreen(),
      },
    );
  }
}
