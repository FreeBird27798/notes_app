import 'package:flutter/material.dart';
import 'package:notes_app/utils/size_config.dart';
import 'package:notes_app/widgets/notes_app_text.dart';

class AppHelpers {
  static void showSnackBar({
    required BuildContext context,
    required String message,
    bool error = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: NotesAppText(
        text: message,
        textColor: Colors.white,
        fontSize: SizeConfig.scaleTextFont(20),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: error ? Colors.red : Colors.green,
    ));
  }
}
