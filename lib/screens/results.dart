import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusable_card.dart';
import 'package:bmi_calculator/components/button_button.dart';


class  ResultsPage extends StatelessWidget {

  ResultsPage({@required this.interpretation, @required this.bmiResult, @required this.resultText});

  final  String bmiResult;
  final String  resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                child: Center(
                  child: Text('Your Result',
                    style: TitleTextStyle,
                  ),
                ),
              ),
          ),
          Expanded(
            flex:5,
            child: ReusableCard(
                colour: ActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget>[Text(
                  resultText,
                  style: ResultTextStyle,
                ),
                  Text(
                    bmiResult,
                    style:BMITextStyle,
                  ),
                  Text(
                    interpretation,
                    style: BodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
           buttonTitle: 'Re-Calculate',
           onTap: (){
              Navigator.pop(context);
          },
          ),

        ],

      ),
    );
    return Container();
  }
}
