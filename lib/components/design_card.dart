import 'package:flutter/material.dart';
import '../constants.dart';

class DesignCard extends StatelessWidget {
  DesignCard({this.icon, this.label});
  final  IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size:80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style:labelTextStyle,
        )
      ],
    );
  }
}