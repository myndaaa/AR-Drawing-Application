import 'package:flutter/material.dart';

class GradientTheme {
  static const Color startColor = Color(0xFF64B261); // #64B261
  static const Color endColor = Color(0xFF2B4C29);   // #2B4C29

  static LinearGradient get linearGradient => const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [startColor, endColor],
  );

  static BoxDecoration get boxDecoration => BoxDecoration(
    gradient: linearGradient,
  );
}


/*
* Sample Usage of this thing
*
*  Widget build(BuildContext context) {
    return Container(
      decoration: GradientTheme.boxDecoration,
      child: Center(
        child: Text(
          'shobuj theke shobuj',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
*
*
* */