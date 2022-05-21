import 'package:flutter/material.dart';
import 'package:keto_diet/screens/login_screen.dart';
import 'package:keto_diet/widgets/original_button.dart';

class AuthForm extends StatefulWidget {
  final AuthType authType;

  const AuthForm({Key? key, required this.authType}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '', _password = '';
  AuthBase authBase = AuthBase();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Enter your email',
                hintText: 'ex: test@gmail.com',
              ),
              onChanged: (value) {
                _email = value;
              },
              validator: (value) =>
                  value!.isEmpty ? 'You must enter a valid email' : null,
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Enter your password',
              ),
              obscureText: true,
              onChanged: (value) {
                _password = value;
              },
              validator: (value) => value!.length <= 6
                  ? 'Your password must be larger than 6 characters'
                  : null,
            ),
            const SizedBox(height: 20),
            OrignalButton(
              text: widget.authType == AuthType.login ? 'login' : 'Register',
              textcolor: Colors.white,
              bgcolor: Colors.lightGreen,
              height: 40,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  if (widget.authType == AuthType.login) {
                    await authBase.loginWithEmailAndPassword(_email, _password);
                    Navigator.of(context).pushReplacementNamed('home');
                  } else {
                    await authBase.registerWithEmailAndPassword(
                        _email, _password);
                    Navigator.of(context).pushReplacementNamed('home');
                  }
//                  print(_email);
//                  print(_password);
                }
              },
            ),
            const SizedBox(height: 6),
            TextButton(
              onPressed: () {
                if (widget.authType == AuthType.login) {
                  Navigator.of(context).pushReplacementNamed('register');
                } else {
                  Navigator.of(context).pushReplacementNamed('login');
                }
              },
              child: Text(
                widget.authType == AuthType.login
                    ? 'Don\'t have an account'
                    : 'You have an account',
                style: const TextStyle(color: Colors.black54, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AuthBase {
  loginWithEmailAndPassword(String email, String password) {}

  registerWithEmailAndPassword(String email, String password) {}
}
