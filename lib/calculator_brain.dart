import 'dart:math';

enum Status {
  overweight,
  normal,
  underweight,
}

Map<Status, String> bmiInterpretation = {
  Status.overweight: 'You have a higher than normal body weight. Try to exercise more.',
  Status.normal: 'You have a normal body weight. Good job!',
  Status.underweight: 'You have a lower than normal body weight. You can eat a bit more.',
};

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi;

  CalculatorBrain(this.height, this.weight);

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  Status getResult() {
    if (_bmi >= 25) {
      return Status.overweight;
    } else if (_bmi > 18.5) {
      return Status.normal;
    } else {
      return Status.underweight;
    }
  }

  String getInterpretation() {
    return bmiInterpretation[getResult()];
  }
}
