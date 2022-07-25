import 'package:movies/models/movie.dart';

abstract class MoviesState {
  final List<Movie> movies;

  MoviesState({
    required this.movies
  });
}

class MoviesLoadingState extends MoviesState {
  MoviesLoadingState() : super(movies: []);
}

class MoviesIndexState extends MoviesState {
  MoviesIndexState({
    required List<Movie> movies
  }) : super(movies: movies);
}

class MoviesErrorState extends MoviesState {
  final String errorMessage;

  MoviesErrorState({
    required this.errorMessage
  }) : super(movies: []);
}
