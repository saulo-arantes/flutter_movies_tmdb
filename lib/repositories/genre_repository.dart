import 'package:movies/http/genre_controller.dart';
import 'package:movies/models/genre.dart';

class GenreRepository {
  final GenreController controller = GenreController();

  Future<List<Genre>> index(String type) async {
    return await controller.index(type);
  }
}