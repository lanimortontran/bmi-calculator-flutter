import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

import 'icon_content.dart';

const activeContainerColor = Color(0xFF1D1E33);
const inactiveContainerColor = Color(0xFF111328);
const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveContainerColor;
  Color femaleCardColor = inactiveContainerColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    child: ReusableCard(
                      color: maleCardColor,
                      cardChild: IconContent(
                        icon: Icons.male,
                        label: 'MALE',
                      ),
                    ),
                    onTap: () {
                      print('male card pressed');
                      setState(() {
                        updateColor(Gender.male);
                      });
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: ReusableCard(
                      color: femaleCardColor,
                      cardChild: IconContent(
                        icon: Icons.female,
                        label: 'FEMALE',
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        print('female card pressed');
                        updateColor(Gender.female);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: activeContainerColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: activeContainerColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: activeContainerColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  void updateColor(Gender gender) {
    if (gender == Gender.male) {
      if (maleCardColor == inactiveContainerColor) {
        maleCardColor = activeContainerColor;
        femaleCardColor = inactiveContainerColor;
      } else {
        maleCardColor = inactiveContainerColor;
      }
    }

    if (gender == Gender.female) {
      if (femaleCardColor == inactiveContainerColor) {
        femaleCardColor = activeContainerColor;
        maleCardColor = inactiveContainerColor;
      } else {
        femaleCardColor = inactiveContainerColor;
      }
    }
  }
}
