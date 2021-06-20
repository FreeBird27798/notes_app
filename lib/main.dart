import 'package:flutter/material.dart';
import 'package:notes_app/screens/about_app_screen.dart';
import 'package:notes_app/screens/categories_screen.dart';
import 'package:notes_app/screens/category_notes.dart';
import 'package:notes_app/screens/edit_category_screen.dart';
import 'package:notes_app/screens/new_category_screen.dart';
import 'package:notes_app/screens/new_note_screen.dart';
import 'package:notes_app/screens/profile_screen.dart';
import 'package:notes_app/screens/settings_screen.dart';
import 'package:notes_app/screens/signup_screen.dart';

import 'screens/launch_screen.dart';
import 'screens/login_screen.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      // initialRoute: '/login_screen',
      // initialRoute: '/categories_screen',
      // initialRoute: '/category_notes',
      // initialRoute: '/settings_screen',
      // initialRoute: '/profile_screen',
      // initialRoute: '/new_category_screen',
      // initialRoute: '/new_note_screen',
      // initialRoute: '/about_app_screen',
      routes: {
        '/launch_screen': (context) => LaunchScreen(),
        '/login_screen': (context) => LoginScreen(),
        '/signup_screen': (context) => SignupScreen(),
        '/categories_screen': (context) => CategoriesScreen(),
        '/category_notes': (context) => CategoryNotes(),
        '/settings_screen': (context) => SettingsScreen(),
        '/profile_screen': (context) => ProfileScreen(),
        '/new_category_screen': (context) => NewCategoryScreen(),
        '/new_note_screen': (context) => NewNoteScreen(),
        '/about_app_screen': (context) => AboutAppScreen(),
        '/edit_category_screen': (context) => EditCategoryScreen(),
      },
    );
  }
}
