abstract class MoviesEvent {}

class MoviesIndexEvent extends MoviesEvent {}

class MoviesLoadingEvent extends MoviesEvent {}

class MoviesErrorEvent extends MoviesEvent {
  final String errorMessage;

  MoviesErrorEvent({
    required this.errorMessage
  });
}