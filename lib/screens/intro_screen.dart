import 'package:flutter/material.dart';
import 'package:keto_diet/widgets/original_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (Colors.white),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(),
              Image.asset('assets/images/logo4.png'),
              OrignalButton(
                text: 'Get Started',
                onPressed: () => Navigator.of(context).pushNamed('login'),
                textcolor: Colors.white,
                bgcolor: const Color(0xFFEB1555),
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
