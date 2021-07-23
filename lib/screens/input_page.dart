import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_task_6_cat/components/reusable_card_gender.dart';
import 'package:bmi_calculator_task_6_cat/components/rounded_icon_button.dart';
import '../constants.dart';
import 'package:bmi_calculator_task_6_cat/components/bottom_button.dart';
import 'package:bmi_calculator_task_6_cat/screens/result_page.dart';
import 'package:bmi_calculator_task_6_cat/calculator_brain.dart';
import 'package:bmi_calculator_task_6_cat/constants.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int fieldWeightValue = 60;
  int fieldHeightValue = 162;
  int fieldAgeValue = 29;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Icon(Icons.menu, size: 35),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.notifications_none_outlined,
              size: 35,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'BMI Calculator',
                style: kBMITextStyle,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Gender',
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //********  male
                  //***********************************
                  Expanded(
                    child: ReusableCardGender(
                      color: selectedGender == Gender.Male
                          ? kActivatedColor
                          : kInActivatedColor,
                      cardChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Icon(
                              FontAwesomeIcons.male,
                              size: 80,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Center(child: Text('Male')),
                          ),
                        ],
                      ),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.Male;

                          print('male');
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 20.0),

                  //*************  female
                  //*************************************
                  Expanded(
                    child: ReusableCardGender(
                      color: selectedGender == Gender.Female
                          ? kActivatedColor
                          : kInActivatedColor,
                      cardChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Icon(
                              FontAwesomeIcons.female,
                              size: 80,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Center(child: Text('Female')),
                          ),
                        ],
                      ),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.Female;

                          print('female');
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            //************************** second section            Weight
            //********************************************
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Weight',
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RoundedIconButton(
                                icon: Icons.remove,
                                onPress: () {
                                  setState(() {
                                    fieldWeightValue--;
                                    print(fieldWeightValue);
                                  });
                                }),
                            Row(
                              crossAxisAlignment:CrossAxisAlignment.baseline ,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(fieldWeightValue.toString(),
                                    style: kFieldValueStyle),
                                Text('kg', style: kMeasureUnit),
                              ],
                            ),
                            RoundedIconButton(
                              icon: Icons.add,
                              onPress: () {
                                setState(() {
                                  fieldWeightValue++;
                                });
                              },
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'kg',
                              style: kMeasuringUnit,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: Colors.black,
                              size: 25,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            //************************** third section             Height
            //**************************************************
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Height',
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RoundedIconButton(
                              icon: Icons.remove,
                              onPress: () {
                                setState(() {
                                  fieldHeightValue--;
                                });
                              },
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(fieldHeightValue.toString(),
                                    style: kFieldValueStyle),
                                Text('cm', style: kMeasureUnit,)
                              ],
                            ),
                            RoundedIconButton(
                              icon: Icons.add,
                              onPress: () {
                                setState(() {
                                  fieldHeightValue++;
                                });
                              },
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'cm',
                              style: kMeasuringUnit,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: Colors.black,
                              size: 25,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            //****************************** fourth section       Age
            //**********************************************
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Age',
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: RoundedIconButton(
                          icon: Icons.remove,
                          onPress: () {
                            setState(() {
                              fieldAgeValue--;
                            });
                          },
                        ),
                      ),
                      Expanded(
                          child: Center(
                              child: Text(fieldAgeValue.toString(),
                                  style: kFieldValueStyle))),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: RoundedIconButton(
                          icon: Icons.add,
                          onPress: () {
                            setState(() {
                              fieldAgeValue++;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            BottomButton(
              onPress: () {
                CalculatorBrain calc = CalculatorBrain(
                    weight: fieldWeightValue, height: fieldHeightValue);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: calc.calculateBmi(),
                      interpretation: calc.getInterpretation(),
                      resultText: calc.getResult(),
                    ),
                  ),
                );
              },
              bottomButtonText: 'CALCULATE',
            ),
          ],
        ),
      ),
    );
  }
}
