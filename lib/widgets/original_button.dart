import 'package:flutter/material.dart';

class OrignalButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textcolor;
  final Color bgcolor;
  final double height;

  const OrignalButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.textcolor,
      required this.bgcolor,
      required this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(bgcolor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textcolor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
