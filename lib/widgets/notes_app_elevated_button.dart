import 'package:flutter/material.dart';
import 'package:notes_app/utils/app_colors.dart';
import 'package:notes_app/utils/size_config.dart';

class NotesAppElevatedButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final double marginStart;
  final double marginEnd;
  final double borderRadius;
  final FontWeight fontWeight;
  final String fontFamily;
  final Color textColor;
  final Color backgroundColor;
  final void Function()? onPressed;

  NotesAppElevatedButton({
    required this.text,
    this.onPressed,
    // this.fontSize = SizeConfig.scaleTextFont(20),
    this.fontSize = 20,
    this.fontFamily = 'Roboto',
    this.marginStart = 0,
    this.marginEnd = 0,
    this.borderRadius = 26,
    this.textColor = Colors.white,
    this.backgroundColor = AppColors.APP_BLUE_COLOR,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: marginStart, end: marginEnd),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: backgroundColor,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
          minimumSize: Size.fromHeight(SizeConfig.scaleHeight(53)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
