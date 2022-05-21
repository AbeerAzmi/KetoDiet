import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color backColor;
  final Widget? cardChild;
  final Function()? onCardClicked;

  /// A constructor.
  const ReusableCard(
      {Key? key, required this.backColor, this.cardChild, this.onCardClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardClicked,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
