import 'package:bmi_calculator_task_6_cat/components/bottom_button.dart';
import 'package:bmi_calculator_task_6_cat/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_task_6_cat/components/reusable_card_result.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultPage(
      {@required this.bmiResult,
      @required this.interpretation,
      @required this.resultText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: kBMITextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Your Result',
                  style: kYourResultTextStyle,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ReusableCardResult(
                contentChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                        child: Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    )),
                    Center(
                        child: Text(
                      bmiResult,
                      style: kBMIResult,
                    )),
                    Center(
                        child: Text(
                      interpretation,
                      style: kInterpretation,
                      textAlign: TextAlign.center,
                    )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            BottomButton(
              bottomButtonText: "RE-CALCULATED",
              onPress: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
