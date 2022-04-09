import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blueGrey,
      colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blueGrey,
      ).copyWith(
        secondary: Colors.grey,
      ),
    ),
      home: InputPage(),
    );
  }

}
