import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/utils/app_colors.dart';
import 'package:notes_app/utils/app_dummy_data.dart';
import 'package:notes_app/utils/size_config.dart';
import 'package:notes_app/widgets/category_notes_card.dart';
import 'package:notes_app/widgets/notes_app_text.dart';

class CategoryNotes extends StatefulWidget {
  @override
  _CategoryNotesState createState() => _CategoryNotesState();
}

class _CategoryNotesState extends State<CategoryNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title: NotesAppText(
          text: DummyData.CATEGORY_NOTES_TEXT,
          textColor: AppColors.APP_BAR_TITLE_COLOR,
          fontFamily: 'Quicksand',
          fontSize: SizeConfig.scaleTextFont(22),
          // fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/new_note_screen');
            },
            icon: Icon(
              Icons.add_circle,
              color: Colors.black,
            ),
          ),
        ],
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
          itemCount: 5,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: CategoryNotesCard(
                  done: true,
                  title: DummyData.NOTE_TITLE_TEXT,
                  subTitle: DummyData.NOTE_TEXT),
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
