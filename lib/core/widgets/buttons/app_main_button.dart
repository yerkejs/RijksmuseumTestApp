import 'package:flutter/material.dart';
import 'package:yerke_test_app/core/presentation/styles.dart';

class AppMainButton extends StatelessWidget {
  
  final String title;
  final Widget? leadingView;
  final Widget? trailingView;
  final Function? onPress;

  const AppMainButton({ 
    required this.title,
    this.onPress,
    this.leadingView,
    this.trailingView,
    Key? key
   }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(8)
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leadingView != null) 
                ...[
                  leadingView!, 
                  const SizedBox(width: 8) 
                ],
              Text (
                title,
                style: AppTextStyle.regular.copyWith(
                  color: Colors.blue,
                  fontSize: 16
                ),
              ),
              if (trailingView != null) 
                ...[
                  const SizedBox(width: 8),
                  trailingView!
                ]
            ],
          ),
        ),
      ),
    );
  }
}