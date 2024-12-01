import 'package:anime_discovery_app/core/configs/theme/app_colors.dart';
import 'package:anime_discovery_app/data/graphql/graphql_service.dart';
import 'package:flutter/material.dart';

import '../../../data/models/anime_model.dart';
import '../../../core/configs/assets/app_images.dart';
import '../helper/anime_background_image.dart';
import '../helper/anime_details.dart';
import '../helper/navigation_buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AnimeModel? _anime;
  bool _isLoading = true;
  final GraphQlService _graphQlService = GraphQlService();
  int _currentEpisode = 1;

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load({int episode = 1}) async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Fetch the anime based on the current episode
      _anime = await _graphQlService.getAnimes(episodes: episode);
    } catch (e) {
      throw Exception(e);
      // print("Error loading anime: $e");
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _incrementEpisode() {
    setState(() {
      _currentEpisode++;
    });
    _load(episode: _currentEpisode);
  }

  void _decrementEpisode() {
    if (_currentEpisode > 1) {
      setState(() {
        _currentEpisode--;
      });
      _load(episode: _currentEpisode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            )
          : (_anime == null
              ? const Center(
                  child: Text(
                    'No anime found',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : Column(
                  children: [
                    Flexible(
                      flex: 3,
                      child: Stack(
                        children: [
                          AnimeBackgroundImage(
                            imageUrl: _anime!.coverImageUrl!,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  AppColors.background.withOpacity(0.999)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          // Welcome Text
                          Positioned(
                            bottom: 5,
                            left: 16,
                            right: 16,
                            child: ClipRRect(
                              child: SizedBox(
                                height: 60,
                                width: 100,
                                child: Image.asset(
                                  AppImages.movieLogo,
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimeDetails(anime: _anime!),
                            NavigationButtons(
                              onNext: _incrementEpisode,
                              onPrevious: _decrementEpisode,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
    );
  }
}
