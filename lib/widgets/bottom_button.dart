import 'package:flutter/material.dart';
import 'package:keto_diet/constants.dart';

class ButtomButton extends StatelessWidget {
  final Function() onPress;
  final String title;

  const ButtomButton({Key? key, required this.title, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: zSecondaryColor,
        margin: const EdgeInsets.only(top: 10.0),
        height: zMainButtonHeight,
        width: double.infinity,
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Center(
            child: Text(
          title,
          style: zLargeButtonTextStyle,
        )),
      ),
    );
  }
}
