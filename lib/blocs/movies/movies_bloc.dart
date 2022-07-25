import 'package:bloc/bloc.dart';
import 'package:movies/blocs/movies/movies_event.dart';
import 'package:movies/blocs/movies/movies_state.dart';
import 'package:movies/repositories/movie_repository.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MovieRepository repository = MovieRepository();

  final String listType;

  String? genre;

  MoviesBloc({required this.listType, this.genre}) : super(MoviesLoadingState()) {
    on<MoviesIndexEvent>(
      (event, emit) async {
        try {
          emit(MoviesIndexState(movies: await repository.index(listType, genre)));
        } on Exception catch (exception) {
          add(MoviesErrorEvent(errorMessage: exception.toString()));
        }
      }
    );

    on<MoviesLoadingEvent>(
      (event, emit) => emit(MoviesLoadingState()),
    );

    on<MoviesErrorEvent>(
      (event, emit) => emit(
        MoviesErrorState(errorMessage: event.errorMessage)
      ),
    );
  }
}