import 'package:movies/models/genre.dart';

abstract class GenreState {
  final List<Genre> genres;

  GenreState({
    required this.genres
  });
}

class GenreLoadingState extends GenreState {
  GenreLoadingState() : super(genres: []);
}

class GenreIndexState extends GenreState {
  GenreIndexState({
    required List<Genre> genres
  }) : super(genres: genres);
}

class GenreErrorState extends GenreState {
  final String errorMessage;

  GenreErrorState({
    required this.errorMessage
  }) : super(genres: []);
}