 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import  '../components/design_card.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results.dart';
import '../components/button_button.dart';
import '../components/round_iconbutton.dart';
import 'calculator_functionality.dart';

const bottomContainerHeight= 80.0;
const activeCardColour =Colors.white60;
const inactiveCardColour= Colors.white38;
const bottomContainerColour = Colors.black54;

enum Gender{
  male,
  female,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  int height=180;
  int weight = 60;
  int age=18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
                'BMI CALCULATOR'
            ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male? activeCardColour : inactiveCardColour,
                  cardChild: DesignCard(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                ),
              ),
             Expanded(
               child: ReusableCard(
                 onPress: (){
                   setState(() {
                     selectedGender= Gender.female;
                   });
                 },

                 colour: selectedGender == Gender.female ? activeCardColour: inactiveCardColour,
                 cardChild: DesignCard(
                   icon: FontAwesomeIcons.venus,
                   label: 'FEMALE',
                 ),
               ),
              ),
             ],
           )),
          Expanded(
            child: ReusableCard(
              colour: activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text('HEIGHT',
                style: labelTextStyle,
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: labelTextStyle,
                      )
                    ],

                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Colors.black87,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                      inactiveColor: Colors.white60,
                      onChanged: (double newValue){setState(() {
                            height=newValue.round();
                          });
                      },

                    ),
                   ),
                ],

              ),
            ),
           ),
          Expanded(
            child: Row(
            children: <Widget>[
         Expanded(
           child: ReusableCard(
             colour: activeCardColour,
             cardChild: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children:<Widget>[
                 Text('WEIGHT',style: labelTextStyle,
                 ),
                 Text(
                   weight.toString(),
                   style: kNumberTextStyle,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget> [
                     RoundIconButton(
                       icon: FontAwesomeIcons.minus,
                       onPressed: () {
                         setState(() {
                           weight--;
                         });
                       }

                     ),
                     SizedBox(width:10.0),
                     RoundIconButton(
                       icon: FontAwesomeIcons.plus,
                       onPressed: (){
                         setState(() {
                           weight++;
                         });
                       },
                     ),
                   ],
                 ),
               ],
             ),
           ),
            ),
          Expanded(
            child: ReusableCard(
              colour: activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    Text('AGE',
                         style: labelTextStyle,
                        ),
                    Text(age.toString(),style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                          setState(() {
                            age--;
                          });
                        },),
                        SizedBox(width:10.0,),
                        RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                          setState(() {
                            age++;
                          });
                        })
                      ],
                    )
                  ]
              ),
            ),
            ),
            ],
           )),
          //recalculate button
          BottomButton(buttonTitle: 'Calculate',onTap:(){
            CalculatorBrain calc= CalculatorBrain(height:height,weight: weight);

            Navigator.push(
              context,MaterialPageRoute(builder: (context)=>ResultsPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            ),
            ),
            );
          }
          ),
        ],
      ),
    );
  }
}




