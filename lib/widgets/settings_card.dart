import 'package:flutter/material.dart';
import 'package:notes_app/utils/app_colors.dart';
import 'package:notes_app/utils/size_config.dart';

import 'notes_app_text.dart';

class SettingsCard extends StatelessWidget {
  final int index;
  final bool hasTrailing;
  final IconData icon;
  final IconData leadingIcon;
  final Color iconColor;
  final String title;
  final String subTitle;
  final Function() onTap;
  final BorderSide borderSide;

  SettingsCard({
    required this.index,
    this.hasTrailing = true,
    this.icon = Icons.arrow_forward_ios,
    this.iconColor = Colors.black,
    required this.title,
    required this.subTitle,
    required this.onTap,
    required this.leadingIcon,
    this.borderSide = BorderSide.none,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      child: Container(
        decoration: BoxDecoration(
          border: index == 0 || index % 2 == 0
              ? Border(
                  left: BorderSide(
                  width: SizeConfig.scaleWidth(5),
                  color: AppColors.APP_BLUE_COLOR,
                ))
              : Border(
                  right: BorderSide(
                  width: SizeConfig.scaleWidth(5),
                  color: AppColors.APP_BLUE_COLOR,
                )),
        ),
        child: ListTile(
          onTap: onTap,
          horizontalTitleGap: 0,
          leading: CircleAvatar(
            radius: 48,
            backgroundColor: AppColors.APP_BLUE_COLOR,
            child: Icon(
              leadingIcon,
              color: Colors.white,
            ),
          ),
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
          trailing: Visibility(
            visible: hasTrailing,
            child: Icon(icon, color: iconColor),
            replacement: SizedBox.shrink(),
          ),
        ),
      ),
      // ),
    );
  }
}
