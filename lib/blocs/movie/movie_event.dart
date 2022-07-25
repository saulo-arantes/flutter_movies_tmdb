abstract class MovieEvent {}

class MovieLoadedEvent extends MovieEvent {}

class MovieLoadingEvent extends MovieEvent {}

class MovieErrorEvent extends MovieEvent {
  final String errorMessage;

  MovieErrorEvent({
    required this.errorMessage
  });
}