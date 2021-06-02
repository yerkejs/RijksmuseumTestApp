import 'package:flutter/material.dart';
import 'package:yerke_test_app/core/presentation/styles.dart';
import 'package:yerke_test_app/core/utils/link_opener_util.dart';
import 'package:yerke_test_app/core/widgets/buttons/app_main_button.dart';
import 'package:yerke_test_app/feature/main_screen/domain/entities/art_links.dart';

class DetailsFooter extends StatelessWidget {
  
  final ArtLinks artLinks;
  
  const DetailsFooter({ 
    required this.artLinks,
    Key? key
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Links',
            textAlign: TextAlign.start,
            style: AppTextStyle.medium.copyWith(
              color: Colors.white,
              fontSize: 18
            ),
          ),
          const SizedBox(height: 16),
          if (artLinks.search != null)
            ...[
              _buildAppLinkButton(
                title: 'Search',
                url: artLinks.search!
              ),
              const SizedBox(height: 8)
            ],
          if (artLinks.web != null)
            ...[
              _buildAppLinkButton(
                title: "Web",
                url: artLinks.web!
              ),
              const SizedBox(height: 8)
            ],
          if (artLinks.self != null)
            ...[
              _buildAppLinkButton(
                title: "Self",
                url: artLinks.self!
              ),
              const SizedBox(height: 8)
            ]
        ],
      ),      
    );
  }

  Widget _buildAppLinkButton ({
    required String url,
    required String title
  }) => AppMainButton(
    title: title,
    trailingView: Icon(Icons.link, color: Colors.blue,),
    onPress: () {
      LinkOpenerUtil.openLink(url);
    },
  );
}