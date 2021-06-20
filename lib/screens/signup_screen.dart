import 'package:flutter/material.dart';
import 'package:notes_app/utils/app_colors.dart';
import 'package:notes_app/utils/app_dummy_data.dart';
import 'package:notes_app/utils/app_helpers.dart';
import 'package:notes_app/utils/size_config.dart';
import 'package:notes_app/widgets/notes_app_elevated_button.dart';
import 'package:notes_app/widgets/notes_app_text.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController _fNameTextEditingController;
  late TextEditingController _lNameTextEditingController;
  late TextEditingController _emailTextEditingController;
  late TextEditingController _phoneTextEditingController;
  late TextEditingController _passwordTextEditingController;

  String? _fNameError;
  String? _lNameError;
  String? _emailError;
  String? _phoneError;
  String? _passwordError;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fNameTextEditingController = TextEditingController();
    _lNameTextEditingController = TextEditingController();
    _emailTextEditingController = TextEditingController();
    _phoneTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _fNameTextEditingController.dispose();
    _lNameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _phoneTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/launch_bg.png'), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.scaleWidth(26),
          // left: 26,
          right: SizeConfig.scaleWidth(26),
          // right: 26,
          top: SizeConfig.scaleHeight(10),
          // top: 10,
        ),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
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
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NotesAppText(
                  text: DummyData.SIGN_UP,
                  fontSize: SizeConfig.scaleTextFont(30),
                  // fontSize: 30,
                  fontFamily: 'Nunito',
                  textColor: AppColors.LAUNCH_TITLE_COLOR,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: SizeConfig.scaleHeight(5),
                  // height: 5,
                ),
                NotesAppText(
                  text: DummyData.CREATE_ACCOUNT_TEXT,
                  fontSize: SizeConfig.scaleTextFont(18),
                  // fontSize: 18,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Nunito',
                  textColor: AppColors.DO_NOT_HAVE_ACCOUNT_COLOR,
                ),
                SizedBox(
                  height: SizeConfig.scaleHeight(53),
                  // height: 53,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.scaleWidth(15),
                        vertical: SizeConfig.scaleHeight(32)),
                    // horizontal: 15,
                    // vertical: 32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          maxLength: 10,
                          controller: _fNameTextEditingController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              hintText: 'First Name', errorText: _fNameError),
                        ),
                        SizedBox(
                          height: SizeConfig.scaleHeight(18),
                          // height: 18,
                        ),
                        TextField(
                          maxLength: 10,
                          controller: _lNameTextEditingController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                            errorText: _lNameError,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.scaleHeight(18),
                          // height: 18,
                        ),
                        TextField(
                          controller: _emailTextEditingController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            errorText: _emailError,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.scaleHeight(18),
                          // height: 18,
                        ),
                        TextField(
                          controller: _phoneTextEditingController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: 'Phone',
                            errorText: _phoneError,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.scaleHeight(18),
                          // height: 18,
                        ),
                        TextField(
                          controller: _passwordTextEditingController,
                          maxLength: 25,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            errorText: _passwordError,
                          ),
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
                  text: DummyData.SIGN_UP,
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.scaleTextFont(20),
                  // fontSize: 20,
                  onPressed: () {
                    performSignUp();
                  },
                ),
              ],
            ),
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
      _passwordError = _passwordTextEditingController.text.isEmpty
          ? 'Enter Your Password'
          : null;
    });
  }

  bool checkData() {
    if (_fNameTextEditingController.text.isNotEmpty &&
        _lNameTextEditingController.text.isNotEmpty &&
        _emailTextEditingController.text.isNotEmpty &&
        _phoneTextEditingController.text.isNotEmpty &&
        _passwordTextEditingController.text.isNotEmpty) {
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

  void signUp() {
    AppHelpers.showSnackBar(context: context, message: 'Enjoy!');
    Future.delayed(Duration(milliseconds: 500),
        () => Navigator.pushReplacementNamed(context, '/categories_screen'));
  }

  void performSignUp() {
    if (checkData()) {
      signUp();
    }
  }
}
