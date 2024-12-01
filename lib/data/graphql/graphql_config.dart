import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlConfig {
  static HttpLink httpLink = HttpLink("https://graphql.anilist.co");

  GraphQLClient clientToQuery() =>
      GraphQLClient(link: httpLink, cache: GraphQLCache());
}
