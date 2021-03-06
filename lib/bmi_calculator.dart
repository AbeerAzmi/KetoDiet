import 'dart:math';

class BMICalculator {
  BMICalculator({required this.height, required this.weight});

  final int height;
  final int weight;
  double _bmi = 0.0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. exercize more';
    } else if (_bmi > 18.5) {
      return 'You have a normal body. Good Job!';
    } else {
      return 'You have a lower than normal body weight. you may eat a bit more';
    }
  }
}
