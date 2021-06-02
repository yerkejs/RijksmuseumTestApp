import 'package:flutter/material.dart';
import 'package:yerke_test_app/core/constants/app_images.dart';
import 'package:yerke_test_app/core/presentation/styles.dart';
import 'package:yerke_test_app/core/utils/asset_util.dart';
import 'package:yerke_test_app/feature/main_screen/domain/entities/art_image.dart';

class DetailsHeader extends StatelessWidget {
  
  final ArtImage? headerImage;
  final String title;

  const DetailsHeader({ 
    required this.title,
    this.headerImage,
    Key? key
   }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          SizedBox.expand(
            child: FadeInImage(
              placeholder: AssetImage(AssetUtil.getAssetImagePath(AppImages.artObjectPlaceholderImage)), 
              image: NetworkImage(headerImage?.url ?? ''),
              fit: BoxFit.cover,
            )
          ),
          Positioned.fill(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.black26,
                    Colors.black87,
                    Colors.black
                  ],
                  stops: [0.3, 0.7, 1.0]
                )
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 24
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text(
                    title,
                    style: AppTextStyle.bold.copyWith(
                      color: Colors.white,
                      fontSize: 24
                    ),
                    textAlign: TextAlign.center
                  ),
                ],
              ),
            ),
          )
        ],
      ),   
    );
  }
}