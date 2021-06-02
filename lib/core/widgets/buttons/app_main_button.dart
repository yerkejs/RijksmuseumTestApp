import 'package:flutter/material.dart';
import 'package:yerke_test_app/core/presentation/styles.dart';

/// Reusable button which can be used in any place of this application 
class AppMainButton extends StatelessWidget {
  /// Title of the button 
  final String title;
  
  /// Widget which will be located at left side of the title 
  final Widget? leadingView;
  
  /// Widget which will be located at the right side of the title
  final Widget? trailingView;
  
  /// Callback function, will be called when user taps on the button 
  final Function? onPress;


  /// MARK: - Constructor
  const AppMainButton({ 
    required this.title,
    this.onPress,
    this.leadingView,
    this.trailingView,
    Key? key
   }) : super(key: key);

  /// MARK: - UI Helper
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
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
                  color: Theme.of(context).highlightColor,
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