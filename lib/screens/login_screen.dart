import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/utils/app_colors.dart';
import 'package:notes_app/utils/app_dummy_data.dart';
import 'package:notes_app/utils/app_helpers.dart';
import 'package:notes_app/utils/size_config.dart';
import 'package:notes_app/widgets/notes_app_elevated_button.dart';
import 'package:notes_app/widgets/notes_app_text.dart';

void main() => runApp(LoginScreen());

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TapGestureRecognizer _tapGestureRecognizer;

  late TextEditingController _nameTextController;
  late TextEditingController _passwordTextController;

  String? _nameError;
  String? _passwordError;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer();
    _tapGestureRecognizer.onTap = onSignupTap;
    _nameTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  void onSignupTap() => Navigator.pushNamed(context, '/signup_screen');

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/launch_bg.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(26)),
          // horizontal: 26),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NotesAppText(
                  text: DummyData.SIGN_IN,
                  fontSize: SizeConfig.scaleTextFont(30),
                  // fontSize: 30,
                  fontWeight: FontWeight.bold,
                  textColor: AppColors.LAUNCH_TITLE_COLOR,
                ),
                SizedBox(
                  height: SizeConfig.scaleHeight(6),
                  // height: 6,
                ),
                NotesAppText(
                    text: DummyData.SUB_SIGN_IN_TEXT,
                    fontSize: SizeConfig.scaleTextFont(18),
                    // fontSize: 18,
                    fontWeight: FontWeight.w300,
                    textColor: AppColors.LAUNCH_SUB_TITLE_COLOR,
                    fontFamily: 'Nunito'),
                SizedBox(
                  height: SizeConfig.scaleHeight(81),
                  // height: 81,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.scaleWidth(20),
                        vertical: SizeConfig.scaleHeight(32)),
                    // horizontal: 20, vertical: 32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          keyboardType: TextInputType.name,
                          controller: _nameTextController,
                          decoration: InputDecoration(
                            hintText: 'Name...',
                            errorText: _nameError,
                          ),
                          maxLength: 30,
                          minLines: 1,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: SizeConfig.scaleHeight(30),
                          // height: 30,
                        ),
                        TextField(
                          obscureText: true,
                          controller: _passwordTextController,
                          decoration: InputDecoration(
                            errorText: _passwordError,
                            hintText: 'Password',
                            suffixIcon: Icon(
                              Icons.remove_red_eye_rounded,
                              // color: AppColors.PASSWORD_SUFFIX_COLOR,
                            ),
                          ),
                          maxLength: 25,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.scaleHeight(30),
                  // height: 30,
                ),
                NotesAppElevatedButton(
                  text: DummyData.LOGIN_TEXT,
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.scaleTextFont(20),
                  // fontSize: 20,
                  onPressed: () {
                    performLogin();
                  },
                ),
                SizedBox(
                  height: SizeConfig.scaleHeight(10),
                  // height: 10,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: DummyData.DO_NOT_HAVE_ACCOUNT_TEXT,
                        style: TextStyle(
                          color: AppColors.DO_NOT_HAVE_ACCOUNT_COLOR,
                          fontSize: SizeConfig.scaleTextFont(18),
                          // fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: DummyData.SIGN_UP,
                        recognizer: _tapGestureRecognizer,
                        style: TextStyle(
                          color: AppColors.LAUNCH_TITLE_COLOR,
                          fontSize: SizeConfig.scaleTextFont(18),
                          // fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // )
        // ,
      ),
    );
  }

  void checkErrors() {
    setState(() {
      _nameError = _nameTextController.text.isEmpty ? 'Enter Your Name' : null;
      _passwordError =
          _passwordTextController.text.isEmpty ? 'Enter Your Password' : null;
    });
  }

  bool checkData() {
    if (_nameTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      checkErrors();
      return true;
    }
    checkErrors();
    AppHelpers.showSnackBar(
      message: 'Please Enter your email and/or password',
      error: true,
      context: context,
    );
    return false;
  }

  void login() {
    AppHelpers.showSnackBar(context: context, message: 'Logged In');
    Future.delayed(Duration(milliseconds: 500),
        () => Navigator.pushReplacementNamed(context, '/categories_screen'));
  }

  void performLogin() {
    if (checkData()) {
      login();
    }
  }
}
