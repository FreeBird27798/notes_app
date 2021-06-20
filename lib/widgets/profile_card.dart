import 'package:flutter/material.dart';
import 'package:notes_app/utils/app_colors.dart';
import 'package:notes_app/utils/size_config.dart';
import 'notes_app_text.dart';

class ProfileCard extends StatelessWidget {
  final String text;
  final String num;

  ProfileCard({
    required this.text,
    required this.num,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.scaleWidth(13),
            vertical: SizeConfig.scaleHeight(11)),
        // horizontal: 13,
        // vertical: 11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              color: AppColors.APP_BLUE_COLOR, width: SizeConfig.scaleWidth(1)),
          // width: 1),
        ),
        child: Column(
          children: [
            NotesAppText(
              text: text,
              fontWeight: FontWeight.w500,
              textColor: AppColors.APP_BLUE_COLOR,
              fontSize: SizeConfig.scaleTextFont(12),
              // fontSize: 12,
            ),
            SizedBox(
              height: SizeConfig.scaleHeight(5),
              // height: 5,
            ),
            NotesAppText(
              text: num,
              fontWeight: FontWeight.w500,
              textColor: AppColors.WORK_SUB_COLOR,
              fontSize: SizeConfig.scaleTextFont(12),
              // fontSize: 12,
            ),
          ],
        ),
        // color: Colors.green,
      ),
    );
  }
}
