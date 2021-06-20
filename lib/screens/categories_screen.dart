import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/utils/app_colors.dart';
import 'package:notes_app/utils/app_dummy_data.dart';
import 'package:notes_app/utils/size_config.dart';
import 'package:notes_app/widgets/category_card.dart';
import 'package:notes_app/widgets/notes_app_text.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: NotesAppText(
          text: DummyData.CATEGORIES_TEXT,
          textColor: AppColors.APP_BAR_TITLE_COLOR,
          fontFamily: 'Quicksand',
          fontSize: SizeConfig.scaleTextFont(22),
          // fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/settings_screen');
            },
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/new_category_screen');
        },
        backgroundColor: AppColors.APP_BLUE_COLOR,
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.scaleWidth(17),
          // left: 17,
          right: SizeConfig.scaleWidth(17),
          // right: 17,
          top: SizeConfig.scaleHeight(15),
          // top: 15,
        ),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 6,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: CategoryCard(
                avatarLetter: 'W',
                title: DummyData.WORK_TEXT,
                subTitle: DummyData.WORK_SUB_TEXT,
              ),
              onTap: () => Navigator.pushNamed(context, '/category_notes'),
            );
          },
        ),
      ),
    );
  }
}
