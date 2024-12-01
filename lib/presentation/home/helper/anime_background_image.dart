import 'package:flutter/material.dart';

import '../../../core/configs/assets/app_images.dart';

class AnimeBackgroundImage extends StatelessWidget {
  final String imageUrl;

  const AnimeBackgroundImage({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            AppImages.defaultImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          );
        },
      ),
    );
  }
}
