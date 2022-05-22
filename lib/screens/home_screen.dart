import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keto_diet/bmi_calculator.dart';
import 'package:keto_diet/constants.dart';
import 'package:keto_diet/screens/results_screen.dart';
import 'package:keto_diet/widgets/bottom_button.dart';
import 'package:keto_diet/widgets/icon_content.dart';
import 'package:keto_diet/widgets/resuable_card.dart';
import 'package:keto_diet/widgets/round_icon_button.dart';

enum Gender { male, female }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender? selectedGender;
  int userHeight = 180;
  int userWeight = 60;
  int userAge = 20;

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
        children: <Widget>[
          /// Expanded is a widget that takes up the remaining space in the row or column.
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onCardClicked: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    backColor: selectedGender == Gender.male
                        ? zActiveCardColor
                        : zInactiveCardColor,
                    cardChild: const IconContent(
                      iconName: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onCardClicked: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    backColor: selectedGender == Gender.female
                        ? zActiveCardColor
                        : zInactiveCardColor,
                    cardChild: const IconContent(
                      iconName: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    backColor: zActiveCardColor,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'HEIGHT',
                            style: zLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.ideographic,
                            children: <Widget>[
                              Text(
                                userHeight.toString(),
                                style: zNumberStyle,
                              ),
                              const Text(
                                'cm',
                                style: zLabelTextStyle,
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 15.0,
                              ),
                              overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 30.0,
                              ),
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: zPrimaryTextColor,
                              thumbColor: zSecondaryColor,
                              overlayColor: zSliderOverlayColor,
                            ),
                            child: Slider(
                              value: userHeight.toDouble(),
                              min: zSliderMinValue,
                              max: zSliderMaxValue,
                              onChanged: (double newValue) {
                                setState(() {
                                  userHeight = newValue.round();
                                });
                              },
                            ),
                          )
                        ]),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    backColor: zActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'WIEGHT',
                          style: zLabelTextStyle,
                        ),
                        Text(
                          userWeight.toString(),
                          style: zNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  userWeight--;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  userWeight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    backColor: zActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'AGE',
                          style: zLabelTextStyle,
                        ),
                        Text(
                          userAge.toString(),
                          style: zNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  userAge--;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  userAge++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtomButton(
            onPress: () {
              BMICalculator calc =
                  BMICalculator(height: userHeight, weight: userWeight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Results(
                    bmiResults: calc.calculateBMI(),
                    resultText: calc.getResults(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            title: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
