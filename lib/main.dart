import 'package:flutter/material.dart';
import 'package:yerke_test_app/locator.dart' as serviceLocator;
import 'feature/main_screen/presentation/pages/main_screen.dart';

void main() async {
  await serviceLocator.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        errorColor: Colors.red,
        backgroundColor: Colors.black,
        focusColor: Colors.blue,
        buttonColor: Colors.blue[50],
        highlightColor: Colors.blue,
        dividerColor: Colors.grey
      ),
      home: MainScreen(),
    );
  }
}

