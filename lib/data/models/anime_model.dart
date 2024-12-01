class AnimeModel {
  final int? episodes;
  final int? seasonInt;
  final String? coverImageUrl;
  final String? englishTitle;
  final List<String>? genres;
  final int? startDateYear;
  final String? description;

  AnimeModel({
    this.episodes,
    this.seasonInt,
    this.coverImageUrl,
    this.englishTitle,
    this.genres,
    this.startDateYear,
    this.description,
  });

  static AnimeModel fromMap({required Map map}) => AnimeModel(
        episodes: map['episodes'] ?? 0,
        seasonInt: map['seasonInt'] ?? 0,
        coverImageUrl: map['coverImage']?['large'] ?? '',
        englishTitle: map['title']?['english'] ?? 'Unknown Title',
        genres: map['genres'] != null ? List<String>.from(map['genres']) : [],
        startDateYear: map['startDate']?['year'] ?? 0,
        description: map['description'] ?? 'No description available.',
      );
}
