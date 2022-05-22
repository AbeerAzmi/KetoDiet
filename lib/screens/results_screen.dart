import 'package:flutter/material.dart';
import 'package:keto_diet/constants.dart';
import 'package:keto_diet/widgets/bottom_button.dart';
import 'package:keto_diet/widgets/resuable_card.dart';

class Results extends StatelessWidget {
  final String bmiResults;
  final String resultText;
  final String interpretation;

  const Results(
      {Key? key,
      required this.bmiResults,
      required this.resultText,
      required this.interpretation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('BMI CALCULATOR'),
          backgroundColor: const Color(0xFFEB1555),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Expanded(
              child: Center(
                child: Text(
                  'Your Results',
                  style: zTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                backColor: zActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: zResultsTextStyle,
                    ),
                    Text(
                      bmiResults,
                      style: zBMITextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: zBodyTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ButtomButton(
              onPress: () {
                Navigator.pop(context);
              },
              title: 'RE-CALCULATE',
            ),
          ],
        ));
  }
}
