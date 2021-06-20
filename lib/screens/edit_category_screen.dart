import 'package:flutter/material.dart';
import 'package:notes_app/utils/app_dummy_data.dart';
import 'package:notes_app/utils/app_helpers.dart';
import 'package:notes_app/widgets/new_edit_screen.dart';

class EditCategoryScreen extends StatefulWidget {
  const EditCategoryScreen({Key? key}) : super(key: key);

  @override
  _EditCategoryScreenState createState() => _EditCategoryScreenState();
}

class _EditCategoryScreenState extends State<EditCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return NewEditScreen(
      title: DummyData.EDIT_CATEGORY_TEXT,
      subTitle: DummyData.EDIT_CATEGORY_SUB_TEXT,
      hint: DummyData.NEW_CATEGORY_HINT,
      subHint: DummyData.NEW_CATEGORY_SUB_HINT,
      message: 'Edited Successfully!',
      descError: 'Please Enter Description',
      nameError: 'PLease Enter Category Name',
    );
  }
}
