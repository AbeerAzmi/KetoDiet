import 'package:flutter/material.dart';
import 'package:keto_diet/constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onPress;

  const RoundIconButton({
    Key? key,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 0.0,
      shape: const CircleBorder(),
      fillColor: zMathButtonInactiveColor,
      constraints: zRoundIconButtonConstraint,
      onPressed: onPress,
    );
  }
}
