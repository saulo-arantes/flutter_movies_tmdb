import 'package:movies/http/movie_controller.dart';
import 'package:movies/models/movie.dart';

class MovieRepository {
  final MovieController controller = MovieController();

  static const String TRENDING = 'trending';

  static const String UPCOMING = 'upcoming';

  static const String TOP_RATED = 'topRated';

  static const String BY_GENRE = 'byGenre';

  Future<List<Movie>> index(String index, String? genre) async {
    if (index == TRENDING) {
      return await trending();
    }

    if (index == UPCOMING) {
      return await upcoming();
    }

    if (index == TOP_RATED) {
      return await topRated();
    }

    if (index == BY_GENRE && genre != null) {
      return await byGenre(genre: genre);
    }

    return [];
  }

  Future<List<Movie>> trending() async {
    return await controller.trending();
  }

  Future<List<Movie>> topRated() async {
    return await controller.topRated();
  }

  Future<List<Movie>> upcoming() async {
    return await controller.upcoming();
  }

  Future<List<Movie>> byGenre({String? genre}) async {
    return await controller.byGenre(genre: genre);
  }
}