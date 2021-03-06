import 'package:flutter/material.dart';

//create an icon from scratch
class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});
  final  IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 4.0,
      constraints: BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.grey,
    );
  }
}
