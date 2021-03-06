import 'package:flutter/material.dart';
import '../screens/input_page.dart';
import '../constants.dart';
class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector( //multiscreen code
      onTap: onTap,
      child: Container(
        child:Center(
          child: Text(
            buttonTitle,
            style:largeButtonTextStyle,
          ),
        ) ,
        color: bottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}