import 'package:flutter/material.dart';
import 'package:notes_app/utils/app_dummy_data.dart';
import 'package:notes_app/widgets/new_edit_screen.dart';

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
