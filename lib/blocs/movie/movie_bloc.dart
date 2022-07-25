import 'package:bloc/bloc.dart';
import 'package:movies/blocs/movie/movie_event.dart';
import 'package:movies/blocs/movie/movie_state.dart';
import 'package:movies/repositories/movie_repository.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository repository = MovieRepository();

  final int id;
  
  MovieBloc({required this.id}) : super(MovieLoadingState()) {
    on<MovieLoadedEvent>(
      (event, emit) async {
        try {
          emit(MovieLoadedState(movie: await repository.getMovie(id: id)));
        } on Exception catch (exception) {
          add(MovieErrorEvent(errorMessage: exception.toString()));
        }
      }
    );

    on<MovieLoadingEvent>(
      (event, emit) => emit(MovieLoadingState()),
    );

    on<MovieErrorEvent>(
      (event, emit) => emit(
        MovieErrorState(errorMessage: event.errorMessage)
      ),
    );
  }
}