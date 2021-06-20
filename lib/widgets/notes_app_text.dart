import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotesAppText extends StatelessWidget {
  final String text;
  final String fontFamily;
  final Color textColor;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign textAlign;
  final FontStyle fontStyle;

  NotesAppText({
    required this.text,
    this.fontFamily = 'Roboto',
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.normal,
    // this.fontSize =SizeConfig.scaleTextFont(15),
    this.fontSize = 15,
    this.textAlign = TextAlign.start,
    this.fontStyle = FontStyle.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: fontFamily,
          color: textColor,
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontStyle: fontStyle),
    );
  }
}
