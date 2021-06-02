import 'package:flutter/material.dart';

/// Handler which shows errors in the UI 
abstract class ErrorHandler {
  
  /// This method shows error message via Snackbar
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