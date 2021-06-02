import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yerke_test_app/core/constants/app_images.dart';
import 'package:yerke_test_app/core/presentation/styles.dart';
import 'package:yerke_test_app/core/utils/asset_util.dart';
import 'package:yerke_test_app/feature/main_screen/domain/entities/art_object.dart';

class CollectionItem extends StatelessWidget {

  final ArtObject artObject;
  final Function? onTap;

  CollectionItem({
    required this.artObject,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        child: Stack(
          children: [
            SizedBox.expand(
              child: CachedNetworkImage(
                memCacheHeight: 500,
                memCacheWidth: (500 * artObject.webImage.aspectRation).round(),
                imageUrl: artObject.webImage.url,
                fit: BoxFit.cover,
                fadeInDuration: Duration(seconds: 0),
                fadeOutDuration: Duration(seconds: 0),
                placeholder: (_, String url) => Image.asset(AssetUtil.getAssetImagePath(
                  AppImages.artObjectPlaceholderImage
                )),
                errorWidget: (_, String url, error) =>  Image.asset(AssetUtil.getAssetImagePath(
                  AppImages.artObjectPlaceholderImage
                )),
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
                      Colors.black87
                    ],
                    stops: [0.4, 1.0]
                  )
                ),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Text(
                      artObject.title,
                      style: AppTextStyle.semibold.copyWith(
                        color: Colors.white
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      artObject.principalOrFirstMaker,
                      maxLines: 2,
                      style: AppTextStyle.regular.copyWith(
                        color: Colors.grey
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}