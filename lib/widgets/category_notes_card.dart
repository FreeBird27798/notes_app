import 'package:flutter/material.dart';
import 'package:notes_app/utils/app_colors.dart';
import 'package:notes_app/utils/app_dummy_data.dart';
import 'package:notes_app/utils/size_config.dart';

import 'notes_app_text.dart';

class CategoryNotesCard extends StatelessWidget {
  final bool done;
  final String title;
  final String subTitle;

  CategoryNotesCard({
    this.done = true,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
                width: SizeConfig.scaleWidth(4),
                // width: 4.0,
                color: AppColors.APP_BLUE_COLOR),
            right: BorderSide(
                width: SizeConfig.scaleWidth(4),
                // width: 4.0,
                color: AppColors.APP_BLUE_COLOR),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.scaleWidth(10), vertical: SizeConfig.scaleHeight(18)),
              // horizontal: SizeConfig.scaleWidth(10),
              // vertical: 18),
          child: ListTile(
            title: NotesAppText(
              text: title,
              fontFamily: 'Quicksand',
              textColor: Colors.black,
              fontSize: SizeConfig.scaleTextFont(13),
              // fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            subtitle: NotesAppText(
              text: subTitle,
              fontFamily: 'Quicksand',
              fontSize: SizeConfig.scaleTextFont(12),
              // fontSize: 12,
              textColor: AppColors.WORK_SUB_COLOR,
              fontWeight: FontWeight.w500,
            ),
            trailing: Icon(
              Icons.assignment_turned_in_outlined,
              color: done
                  ? AppColors.NOT_DONE_NOTE_COLOR
                  : AppColors.DONE_NOTE_COLOR,
            ),
          ),
        ),
      ),
    );
  }
}
