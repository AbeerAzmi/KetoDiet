import 'package:flutter/material.dart';
import 'package:keto_diet/constants.dart';

class IconContent extends StatelessWidget {
  final IconData iconName;
  final String label;

  const IconContent({Key? key, required this.iconName, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconName,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: zLabelTextStyle,
        )
      ],
    );
  }
}
