import 'package:flutter/material.dart';
import 'package:yerke_test_app/core/presentation/styles.dart';

class DetailsInfoWidget extends StatelessWidget {
  final String subtitle;
  final String description;
  final List<Color> colors;

  DetailsInfoWidget({
    required this.subtitle,
    required this.description,
    this.colors = const <Color>[]
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            subtitle,
            style: AppTextStyle.regular.copyWith(
              color: Colors.grey
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: AppTextStyle.regular.copyWith(
              color: Colors.white
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 48,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: colors.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 48,
                  height: 48,
                  color: colors[index],
                );
              }
            ),
          )
        ],
      ),
    );
  }
}