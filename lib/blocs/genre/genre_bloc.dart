import 'package:bloc/bloc.dart';
import 'package:movies/blocs/genre/genre_event.dart';
import 'package:movies/blocs/genre/genre_state.dart';
import 'package:movies/repositories/genre_repository.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  final GenreRepository repository = GenreRepository();

  final String listType;

  GenreBloc({required this.listType}) : super(GenreLoadingState()) {
    on<GenreIndexEvent>(
      (event, emit) async {
        try {
          emit(GenreIndexState(genres: await repository.index(listType)));
        } on Exception catch (exception) {
          add(GenreErrorEvent(errorMessage: exception.toString()));
        }
      }
    );

    on<GenreLoadingEvent>(
      (event, emit) => emit(GenreLoadingState()),
    );

    on<GenreErrorEvent>(
      (event, emit) => emit(
        GenreErrorState(errorMessage: event.errorMessage)
      ),
    );
  }
}