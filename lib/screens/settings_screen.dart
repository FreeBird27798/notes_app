import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/utils/app_colors.dart';
import 'package:notes_app/utils/app_dummy_data.dart';
import 'package:notes_app/utils/size_config.dart';
import 'package:notes_app/widgets/notes_app_text.dart';
import 'package:notes_app/widgets/settings_card.dart';
import 'package:notes_app/widgets/sigunature_text.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
          text: DummyData.SETTINGS_TEXT,
          textColor: AppColors.APP_BAR_TITLE_COLOR,
          fontFamily: 'Quicksand',
          fontSize: SizeConfig.scaleTextFont(22),
          // fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.scaleWidth(18),
                right: SizeConfig.scaleWidth(18),
                top: SizeConfig.scaleHeight(25)),
            // left: 18,
            // right: 18,
            // top: 25),
            child: Column(
              children: [
                CircleAvatar(
                  child: NotesAppText(
                    text: 'T',
                    fontSize: SizeConfig.scaleTextFont(24),
                    // fontSize: 24,
                  ),
                  backgroundColor: AppColors.APP_BLUE_COLOR,
                  radius: 40,
                ),
                SizedBox(
                  height: SizeConfig.scaleHeight(8),
                  // height: 8,
                ),
                NotesAppText(
                  text: 'Taj M.',
                  fontFamily: 'Quicksand',
                  textColor: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                NotesAppText(
                  text: 'tajmsabra@gmail.com',
                  fontFamily: 'Quicksand',
                  textColor: AppColors.WORK_SUB_COLOR,
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.scaleTextFont(13),
                  // fontSize: 13,
                ),
                SizedBox(
                  height: SizeConfig.scaleHeight(10),
                  // height: 10,
                ),
                Divider(
                  color: AppColors.DIVIDER_COLOR,
                  endIndent: SizeConfig.scaleWidth(45),
                  // endIndent: 45,
                  indent: SizeConfig.scaleWidth(45),
                  // indent: 45,
                  thickness: 1,
                ),
                SizedBox(
                  height: SizeConfig.scaleHeight(25),
                  // height: 25,
                ),
                SettingsCard(
                    leadingIcon: Icons.language,
                    index: 0,
                    title: DummyData.LANGUAGE_TEXT,
                    subTitle: DummyData.LANGUAGE_SUB_TEXT,
                    onTap: () => print('Language')
                    // Navigator.pushNamed(context, 'routeName'),
                    ),
                SizedBox(
                  height: SizeConfig.scaleHeight(10),
                  // height: 10,
                ),
                SettingsCard(
                  leadingIcon: Icons.person_outline,
                  hasTrailing: true,
                  index: 1,
                  title: DummyData.PROFILE_TEXT,
                  subTitle: DummyData.PROFILE_SUB_TEXT,
                  onTap: () => Navigator.pushNamed(context, '/profile_screen'),
                ),
                SizedBox(
                  height: SizeConfig.scaleHeight(10),
                  // height: 10,
                ),
                SettingsCard(
                  leadingIcon: Icons.perm_device_info_rounded,
                  hasTrailing: true,
                  index: 2,
                  title: DummyData.ABOUT_APP_TEXT,
                  subTitle: DummyData.ABOUT_APP_SUB_TEXT,
                  onTap: () =>
                      Navigator.pushNamed(context, '/about_app_screen'),
                ),
                SizedBox(
                  height: SizeConfig.scaleHeight(10),
                  // height: 10,
                ),
                SettingsCard(
                    leadingIcon: Icons.info,
                    hasTrailing: true,
                    index: 3,
                    title: DummyData.ABOUT_COURSE_TEXT,
                    subTitle: DummyData.ABOUT_COURSE_SUB_TEXT,
                    onTap: () => print('About Course')
                    // Navigator.pushNamed(context, '/about_course_screen'),
                    ),
                SizedBox(
                  height: SizeConfig.scaleHeight(10),
                  // height: 10,
                ),
                SettingsCard(
                  leadingIcon: Icons.power_settings_new,
                  hasTrailing: true,
                  index: 4,
                  title: DummyData.LOGOUT_TEXT,
                  subTitle: DummyData.LOGOUT_SUB_TEXT,
                  onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                      '/login_screen', (Route<dynamic> route) => false),
                ),
              ],
            ),
          ),
          SignatureText(),
        ],
      ),
    );
  }
}
