import 'package:movies/http/movie_controller.dart';
import 'package:movies/models/movie.dart';

class MovieRepository {
  final MovieController controller = MovieController();

  Future<Movie> getMovie({required int id}) async {
    return await controller.getMovie(id: id);
  }
}