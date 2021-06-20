import 'package:flutter/material.dart';
import 'package:notes_app/utils/app_colors.dart';
import 'package:notes_app/utils/app_dummy_data.dart';
import 'package:notes_app/utils/size_config.dart';
import 'notes_app_text.dart';

class SignatureText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: SizeConfig.scaleHeight(20),
      // bottom: 20,
      child: NotesAppText(
        text: DummyData.SIGNATURE_TEXT,
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w300, //LIGHT
        textColor: AppColors.SIGNATURE_COLOR,
      ),
    );
  }
}
