import 'package:flutter/material.dart';
import 'package:notes_app/utils/app_colors.dart';
import 'package:notes_app/utils/app_dummy_data.dart';
import 'package:notes_app/utils/app_helpers.dart';
import 'package:notes_app/utils/size_config.dart';
import 'package:notes_app/widgets/new_edit_screen.dart';
import 'package:notes_app/widgets/notes_app_elevated_button.dart';
import 'package:notes_app/widgets/notes_app_text.dart';

class NewCategoryScreen extends StatefulWidget {
  const NewCategoryScreen({Key? key}) : super(key: key);

  @override
  _NewCategoryScreenState createState() => _NewCategoryScreenState();
}

class _NewCategoryScreenState extends State<NewCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return NewEditScreen(
      title: DummyData.NEW_CATEGORY_TEXT,
      subTitle: DummyData.NEW_CATEGORY_SUB_TEXT,
      hint: DummyData.NEW_CATEGORY_HINT,
      subHint: DummyData.NEW_CATEGORY_SUB_HINT,
      message: 'Category Added Successfully!',
      descError: 'Please Enter Description',
      nameError: 'PLease Enter Category Name',
    );
  }
}
