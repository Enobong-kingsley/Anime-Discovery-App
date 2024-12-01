import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../data/graphql/graphql_service.dart';
import '../helper/anime_background_image.dart';
import '../helper/anime_details.dart';
import '../helper/navigation_buttons.dart';
import '../bloc/anime_bloc.dart';
import '../bloc/anime_event.dart';
import '../bloc/anime_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AnimeBloc(GraphQlService())..add(LoadAnime(episode: 1)),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: BlocBuilder<AnimeBloc, AnimeState>(
          builder: (context, state) {
            if (state is AnimeLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            } else if (state is AnimeError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            } else if (state is AnimeLoaded) {
              return Column(
                children: [
                  Flexible(
                    flex: 3,
                    child: Stack(
                      children: [
                        AnimeBackgroundImage(
                            imageUrl: state.anime.coverImageUrl!),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                AppColors.background.withOpacity(0.999),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
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
                          AnimeDetails(anime: state.anime),
                          NavigationButtons(
                            onNext: () {
                              context.read<AnimeBloc>().add(
                                  LoadAnime(episode: state.currentEpisode + 1));
                            },
                            onPrevious: () {
                              if (state.currentEpisode > 1) {
                                context.read<AnimeBloc>().add(LoadAnime(
                                    episode: state.currentEpisode - 1));
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
