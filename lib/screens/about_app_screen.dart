import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/utils/app_colors.dart';
import 'package:notes_app/utils/app_dummy_data.dart';
import 'package:notes_app/utils/size_config.dart';
import 'package:notes_app/widgets/launch_about_card.dart';
import 'package:notes_app/widgets/notes_app_elevated_button.dart';
import 'package:notes_app/widgets/notes_app_text.dart';
import 'package:notes_app/widgets/sigunature_text.dart';

class AboutAppScreen extends StatefulWidget {
  @override
  _AboutAppScreenState createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/launch_bg.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: NotesAppText(
            text: DummyData.ABOUT_APP_TEXT,
            textColor: AppColors.APP_BAR_TITLE_COLOR,
            fontFamily: 'Quicksand',
            fontSize: SizeConfig.scaleTextFont(22),
            // fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.transparent,
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
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: AppColors.APP_BLUE_COLOR,
                      width: SizeConfig.scaleWidth(5)),
                      // width: 5),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.scaleWidth(60),
                    vertical: SizeConfig.scaleHeight(30)),
                    // horizontal: 60,
                    // vertical: 30),
                child: LaunchAboutCard(),
              ),
            ),
            SignatureText(),
          ],
        ),
      ),
    );
  }
}

