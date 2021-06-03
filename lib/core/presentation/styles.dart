import 'package:flutter/material.dart';

/// Main styles of the texts in while application
class AppTextStyle {
  static final TextStyle regular = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14 
  );

  static final TextStyle medium = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15
  );

  static final TextStyle semibold = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15
  );

  static final TextStyle bold = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16 
  );

  static final TextStyle extrabold = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 18
  );
}

/// Main Theme of the application
abstract class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.black,
    errorColor: Colors.red,
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    focusColor: Colors.blue,
    buttonColor: Colors.blue[50],
    highlightColor: Colors.blue,
    dividerColor: Colors.grey
  );
}