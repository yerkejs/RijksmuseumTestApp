import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[350]!,
      direction: ShimmerDirection.ttb,
      child: Container(
        color: Colors.white,
      )
    );
  }
}