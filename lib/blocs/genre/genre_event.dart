abstract class GenreEvent {}

class GenreLoadingEvent extends GenreEvent {}

class GenreIndexEvent extends GenreEvent {}

class GenreErrorEvent extends GenreEvent {
  final String errorMessage;

  GenreErrorEvent({
    required this.errorMessage
  });
}