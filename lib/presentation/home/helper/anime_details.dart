import 'package:flutter/material.dart';

import '../../../data/models/anime_model.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/theme/app_colors.dart';

class AnimeDetails extends StatelessWidget {
  final AnimeModel anime;

  const AnimeDetails({required this.anime, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${anime.englishTitle}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    '${anime.startDateYear} | ${anime.genres?.join(', ')}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => _showAnimePopup(context, anime.coverImageUrl!),
              child: const CircleAvatar(
                backgroundColor: AppColors.primary,
                radius: 30,
                child: Icon(Icons.play_arrow, color: Colors.white, size: 30),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Season ${anime.seasonInt}, Episode ${anime.episodes}',
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "${anime.description}",
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  void _showAnimePopup(BuildContext context, String imageurl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: InteractiveViewer(
              child: Image.network(
                imageurl,
                fit: BoxFit.cover,
                width: 300.0,
                height: 400.0,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    AppImages.defaultImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
