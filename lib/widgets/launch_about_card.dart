import 'package:flutter/material.dart';
import 'package:notes_app/utils/app_colors.dart';
import 'package:notes_app/utils/app_dummy_data.dart';
import 'package:notes_app/utils/size_config.dart';

import 'notes_app_text.dart';

class LaunchAboutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.APP_BLUE_COLOR,
          backgroundImage: AssetImage(
            'images/launch_icon.png',
          ),
          radius: 50,
        ),
        SizedBox(
          height: SizeConfig.scaleHeight(12),
          // height: 12,
        ),
        NotesAppText(
          text: DummyData.LAUNCH_TITLE,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.scaleTextFont(30),
          // fontSize: 30,
          textColor: AppColors.LAUNCH_TITLE_COLOR,
        ),
        NotesAppText(
          text: DummyData.LAUNCH_SUB_TITLE,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w300,
          fontSize: SizeConfig.scaleTextFont(18),
          // fontSize: 18,
          textColor: AppColors.LAUNCH_SUB_TITLE_COLOR,
        ),
      ],
    );
  }
}
