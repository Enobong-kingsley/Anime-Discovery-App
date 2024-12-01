import 'package:anime_discovery_app/data/models/anime_model.dart';
import 'package:anime_discovery_app/data/graphql/graphql_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlService {
  static GraphQlConfig graphQlConfig = GraphQlConfig();
  GraphQLClient client = graphQlConfig.clientToQuery();

  Future<AnimeModel?> getAnimes({required int episodes}) async {
    try {
      QueryResult result = await client.query(
        QueryOptions(
          fetchPolicy: FetchPolicy.noCache,
          document: gql("""
          query AnimeQuery(\$episodes: Int) {
            Media(episodes: \$episodes) {
              episodes
              seasonInt
              coverImage {
                large
              }
              title {
                english
              }
              genres
              startDate {
                year
              }
              description
            }
          }
        """),
          variables: {"episodes": episodes},
        ),
      );

      if (result.hasException) {
        throw Exception(result.exception.toString());
      }

      Map<String, dynamic>? media = result.data?['Media'];
      // print("GraphQL Response: $media");

      if (media == null) {
        return null; // No data found
      }

      return AnimeModel.fromMap(map: media);
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
