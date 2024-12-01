abstract class AnimeEvent {}

class LoadAnime extends AnimeEvent {
  final int episode;

  LoadAnime({required this.episode});
}
