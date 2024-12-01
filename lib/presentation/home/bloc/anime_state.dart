import '../../../data/models/anime_model.dart';

abstract class AnimeState {}

class AnimeLoading extends AnimeState {}

class AnimeLoaded extends AnimeState {
  final AnimeModel anime;
  final int currentEpisode;

  AnimeLoaded({required this.anime, required this.currentEpisode});
}

class AnimeError extends AnimeState {
  final String message;

  AnimeError(this.message);
}
