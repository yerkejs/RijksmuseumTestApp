import 'package:flutter/material.dart';
import 'package:yerke_test_app/core/presentation/styles.dart';

class AppErrorWidget extends StatelessWidget {
  
  /// Message of the error 
  final String errorMessage;
  
  const AppErrorWidget({ 
    required this.errorMessage,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Error",
            style: AppTextStyle.bold.copyWith(
              color: Colors.red,
              fontSize: 22
            )
          ),
          const SizedBox(height: 8),
          Text(
            errorMessage,
            style: AppTextStyle.regular.copyWith(
              color: Colors.red,
              fontSize: 14
            ),
          )
        ],
      )
    );
  }
}