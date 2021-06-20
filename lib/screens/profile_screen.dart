import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/utils/app_colors.dart';
import 'package:notes_app/utils/app_dummy_data.dart';
import 'package:notes_app/utils/app_helpers.dart';
import 'package:notes_app/utils/size_config.dart';
import 'package:notes_app/widgets/notes_app_elevated_button.dart';
import 'package:notes_app/widgets/notes_app_text.dart';
import 'package:notes_app/widgets/profile_card.dart';
import 'package:notes_app/widgets/settings_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _fNameTextEditingController;
  late TextEditingController _lNameTextEditingController;
  late TextEditingController _emailTextEditingController;
  late TextEditingController _phoneTextEditingController;

  String? _fNameError;
  String? _lNameError;
  String? _emailError;
  String? _phoneError;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fNameTextEditingController = TextEditingController();
    _lNameTextEditingController = TextEditingController();
    _emailTextEditingController = TextEditingController();
    _phoneTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _fNameTextEditingController.dispose();
    _lNameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _phoneTextEditingController.dispose();
    super.dispose();
  }

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
          text: DummyData.PROFILE_TEXT,
          textColor: AppColors.APP_BAR_TITLE_COLOR,
          fontFamily: 'Quicksand',
          fontSize: SizeConfig.scaleTextFont(22),
          // fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.scaleWidth(25),
            // left: 25,
            right: SizeConfig.scaleWidth(25),
            // right: 25,
            top: SizeConfig.scaleHeight(30),
            // top: 30,
          ),
          child: Column(
            children: [
              SettingsCard(
                  index: 0,
                  leadingIcon: Icons.light,
                  hasTrailing: false,
                  title: 'Taj M.',
                  subTitle: 'tajmsabra@gmail.com',
                  onTap: () {}),
              SizedBox(
                height: SizeConfig.scaleHeight(15),
                // height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileCard(text: DummyData.CATEGORIES_TEXT, num: '14'),
                  ProfileCard(text: DummyData.DONE_TEXT, num: '14'),
                  ProfileCard(text: DummyData.WAITING_TEXT, num: '14'),
                ],
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(15),
                // height: 15,
              ),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.scaleWidth(20),
                      vertical: SizeConfig.scaleHeight(20)),
                  // horizontal: 20,
                  // vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        keyboardType: TextInputType.name,
                        controller: _fNameTextEditingController,
                        decoration: InputDecoration(
                          hintText: 'First Name',
                          errorText: _fNameError,
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.scaleHeight(19),
                        // height: 19,
                      ),
                      TextField(
                        keyboardType: TextInputType.name,
                        controller: _lNameTextEditingController,
                        decoration: InputDecoration(
                          hintText: 'Last Name',
                          errorText: _lNameError,
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.scaleHeight(19),
                        // height: 19,
                      ),
                      TextField(
                        keyboardType: TextInputType.phone,
                        controller: _phoneTextEditingController,
                        decoration: InputDecoration(
                          hintText: 'Phone',
                          errorText: _phoneError,
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.scaleHeight(19),
                        // height: 19,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailTextEditingController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          errorText: _emailError,
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(15),
                // height: 15,
              ),
              NotesAppElevatedButton(
                borderRadius: 6,
                fontSize: SizeConfig.scaleTextFont(20),
                // fontSize: 20,
                fontWeight: FontWeight.w500,
                text: DummyData.SAVE_TEXT,
                onPressed: () {
                  performDataSave();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkErrors() {
    setState(() {
      _fNameError = _fNameTextEditingController.text.isEmpty
          ? 'Enter Your First Name'
          : null;
      _lNameError = _lNameTextEditingController.text.isEmpty
          ? 'Enter Your Last Name'
          : null;
      _emailError =
          _emailTextEditingController.text.isEmpty ? 'Enter Your Email' : null;
      _phoneError =
          _phoneTextEditingController.text.isEmpty ? 'Enter Your Phone' : null;
    });
  }

  bool checkData() {
    if (_fNameTextEditingController.text.isNotEmpty &&
        _lNameTextEditingController.text.isNotEmpty &&
        _emailTextEditingController.text.isNotEmpty &&
        _phoneTextEditingController.text.isNotEmpty) {
      checkErrors();
      return true;
    }
    checkErrors();
    AppHelpers.showSnackBar(
      message: 'Please Enter your required Data',
      error: true,
      context: context,
    );
    return false;
  }

  void saveProfile() {
    AppHelpers.showSnackBar(
        context: context, message: 'Profile Saved Successfully');
    Future.delayed(Duration(milliseconds: 500), () => Navigator.pop(context));
  }

  void performDataSave() {
    if (checkData()) {
      saveProfile();
    }
  }
}
