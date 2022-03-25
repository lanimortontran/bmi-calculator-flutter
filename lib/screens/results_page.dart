import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

enum Status {
  overweight,
  normal,
  underweight,
}

Map<Status, String> bmiStatusMap = {
  Status.overweight: 'You are overweight',
  Status.normal: 'You are healthy',
  Status.underweight: 'You are underweight',
};

class ResultsPage extends StatelessWidget {
  Status status = Status.overweight;
  double bmi = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveContainerColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      status.name.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                  ),
                  Text(
                    bmi.toString(),
                    style: kLargeNumberTextStyle,
                  ),
                  Text(
                    bmiStatusMap[status],
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () => Navigator.pop,
          ),
        ],
      ),
    );
  }
}
