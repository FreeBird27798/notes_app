import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/utils/app_colors.dart';
import 'package:notes_app/utils/size_config.dart';
import 'notes_app_text.dart';

class CategoryCard extends StatelessWidget {
  final String avatarLetter;
  final String title;
  final String subTitle;

  CategoryCard({
    required this.avatarLetter,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/category_notes');
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              leading: CircleAvatar(
                radius: 48,
                backgroundColor: AppColors.APP_BLUE_COLOR,
                child: NotesAppText(
                  text: avatarLetter,
                  fontSize: SizeConfig.scaleTextFont(24),
                  // fontSize: 24,
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
              trailing: Icon(Icons.delete, color: AppColors.DELETE_COLOR),
            ),
          ),
          Container(
            width: SizeConfig.scaleWidth(30),
            // // width: 20,
            height: SizeConfig.scaleHeight(80),
            // // height: 73,
            decoration: BoxDecoration(
              color: AppColors.APP_BLUE_COLOR,
            ),
            child: Center(
              child: IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/edit_category_screen'),
                color: Colors.white,
                icon: Icon(
                  Icons.edit,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
