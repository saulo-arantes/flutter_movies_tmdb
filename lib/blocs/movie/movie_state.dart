import 'package:movies/models/movie.dart';

abstract class MovieState {
  final Movie? movie;

  MovieState({
    required this.movie
  });
}

class MovieLoadingState extends MovieState {
  MovieLoadingState() : super(movie: null);
}

class MovieLoadedState extends MovieState {
  MovieLoadedState({
    required Movie? movie
  }) : super(movie: movie);
}

class MovieErrorState extends MovieState {
  final String errorMessage;

  MovieErrorState({
    required this.errorMessage
  }) : super(movie: null);
}