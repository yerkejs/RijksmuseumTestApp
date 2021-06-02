import 'package:flutter/material.dart';

abstract class ErrorHandler {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorUI (BuildContext context, {
    required String error
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(
        error
      ))
    );
  }
}