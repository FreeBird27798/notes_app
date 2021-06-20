import 'package:flutter/material.dart';
import 'package:notes_app/utils/app_dummy_data.dart';
import 'package:notes_app/widgets/new_edit_screen.dart';

class NewNoteScreen extends StatefulWidget {
  const NewNoteScreen({Key? key}) : super(key: key);

  @override
  _NewNoteScreenState createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return NewEditScreen(
      title: DummyData.NEW_NOTE_TEXT,
      subTitle: DummyData.NEW_NOTE_SUB_TEXT,
      hint: DummyData.NEW_NOTE_HINT,
      subHint: DummyData.NEW_NOTE_SUB_HINT,
      message: 'Note Added Successfully!',
      descError: 'Please Enter Description',
      nameError: 'PLease Enter Note Name',
    );
  }
}
