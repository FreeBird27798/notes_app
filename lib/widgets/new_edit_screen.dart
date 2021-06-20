import 'package:flutter/material.dart';
import 'package:notes_app/utils/app_colors.dart';
import 'package:notes_app/utils/app_dummy_data.dart';
import 'package:notes_app/utils/app_helpers.dart';
import 'package:notes_app/utils/size_config.dart';

import 'notes_app_elevated_button.dart';
import 'notes_app_text.dart';

class NewEditScreen extends StatefulWidget {
  final String title;
  final String subTitle;
  final String hint;
  final String subHint;
  final String nameError;
  final String descError;
  final String message;

  NewEditScreen({
    required this.title,
    required this.subTitle,
    required this.hint,
    required this.subHint,
    required this.nameError,
    required this.descError,
    required this.message,
  });

  @override
  _NewEditScreenState createState() => _NewEditScreenState();
}

class _NewEditScreenState extends State<NewEditScreen> {
  late TextEditingController _nameTextEditingController;
  late TextEditingController _descTextEditingController;

  String? _nameError;
  String? _descError;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _nameTextEditingController = TextEditingController();
    _descTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextEditingController.dispose();
    _descTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
      body: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.scaleWidth(25),
          // left: 25,
          right: SizeConfig.scaleWidth(25),
          // right: 25,
          top: SizeConfig.scaleHeight(13),
          // top: 13,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              NotesAppText(
                text: widget.title,
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
                text: widget.subTitle,
                fontSize: SizeConfig.scaleTextFont(18),
                // fontSize: 18,
                fontWeight: FontWeight.w300,
                fontFamily: 'Nunito',
                textColor: AppColors.DO_NOT_HAVE_ACCOUNT_COLOR,
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(42),
                // height: 42,
              ),
              TextField(
                controller: _nameTextEditingController,
                decoration: InputDecoration(
                  hintText: widget.hint,
                  errorText: _nameError,
                ),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(20),
                // height: 20,
              ),
              TextField(
                controller: _descTextEditingController,
                decoration: InputDecoration(
                  hintText: widget.subHint,
                  errorText: _descError,
                ),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(35),
                // height: 35,
              ),
              NotesAppElevatedButton(
                fontSize: SizeConfig.scaleTextFont(20),
                // fontSize: 20,
                fontWeight: FontWeight.w500,
                text: DummyData.SAVE_TEXT,
                onPressed: () => performOperation(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkErrors() {
    setState(() {
      _nameError =
          _nameTextEditingController.text.isEmpty ? widget.nameError : null;
      _descError =
          _descTextEditingController.text.isEmpty ? widget.descError : null;
    });
  }

  bool checkData() {
    if (_nameTextEditingController.text.isNotEmpty &&
        _descTextEditingController.text.isNotEmpty) {
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

  void go() {
    AppHelpers.showSnackBar(context: context, message: widget.message);
    Future.delayed(Duration(milliseconds: 500), () => Navigator.pop(context));
  }

  void performOperation() {
    if (checkData()) go();
  }
}
