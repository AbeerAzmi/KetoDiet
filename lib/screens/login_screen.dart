import 'package:flutter/material.dart';

import '../widgets/auth_form.dart';

enum AuthType { login, register }

class LoginScreen extends StatelessWidget {
  final AuthType authType;
  const LoginScreen({Key? key, required this.authType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 77, 129, 17),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 90,
                      ),
                      const Text(
                        'Welcome In KetoDiet',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Hero(
                        tag: 'logoAnimation',
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: 280,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AuthForm(authType: authType),
          ],
        ),
      ),
    );
  }
}
