import 'package:flutter/material.dart';
import 'package:yerke_test_app/core/presentation/styles.dart';
import 'package:yerke_test_app/core/utils/string_extension.dart';

class DetailsMoreWidget extends StatelessWidget {

  final String? title;
  final List<String>? items; 

  const DetailsMoreWidget({ 
    required this.title,
    this.items = const <String>[],
    Key? key,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title ?? "",
            style: AppTextStyle.medium.copyWith(
              color: Colors.white,
              fontSize: 18
            ),
          ),
          const SizedBox(height: 4),
          
          if ((items ?? []).length == 0)
            Container(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                "Empty",
                style: AppTextStyle.medium.copyWith(
                  color: Colors.grey, 
                  fontSize: 16
                ),
              ),
            ),
          Wrap(
            children: (items ?? []).map<Widget>(
              (item) => Container(
                margin: EdgeInsets.only(right: 4),
                child: Chip(
                  label: Text(
                    item.capitalize()
                  )
                ),
              ) 
            ).toList()
          )
        ],
      ),
    );
  }
}