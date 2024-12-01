import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/graphql/graphql_service.dart';
import 'anime_event.dart';
import 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  final GraphQlService graphQlService;

  AnimeBloc(this.graphQlService) : super(AnimeLoading()) {
    on<LoadAnime>(_onLoadAnime);
  }

  Future<void> _onLoadAnime(LoadAnime event, Emitter<AnimeState> emit) async {
    emit(AnimeLoading());
    try {
      final anime = await graphQlService.getAnimes(episodes: event.episode);
      emit(AnimeLoaded(anime: anime!, currentEpisode: event.episode));
    } catch (e) {
      emit(AnimeError("Failed to load anime: ${e.toString()}"));
    }
  }
}
