import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/blocs/genre/genre_bloc.dart';
import 'package:movies/blocs/genre/genre_event.dart';
import 'package:movies/blocs/genre/genre_state.dart';
import 'package:movies/blocs/movies/movies_bloc.dart';
import 'package:movies/blocs/movies/movies_event.dart';
import 'package:movies/blocs/movies/movies_state.dart';
import 'package:movies/models/genre.dart';
import 'package:movies/pages/widgets/movies_by_genre/movies_by_genre_carousel.dart';
import 'package:movies/pages/widgets/movies_by_genre/movies_by_genre_loading_skeleton.dart';
import 'package:movies/pages/widgets/movies_top_rated/movies_top_rated_carousel.dart';
import 'package:movies/pages/widgets/movies_upcoming/movies_upcoming_loading_skeleton.dart';

class MoviesByGenreIndexWidget extends StatefulWidget {
  const MoviesByGenreIndexWidget({Key? key}) : super(key: key);

  @override
  State<MoviesByGenreIndexWidget> createState() => _MoviesByGenreIndexWidgetState();
}

class _MoviesByGenreIndexWidgetState extends State<MoviesByGenreIndexWidget> {

  late final GenreBloc genreBloc;

  late final MoviesBloc moviesBloc;

  String? genreSelected = '28';
  
  @override
  void initState() {
    super.initState();

    genreBloc = GenreBloc(listType: 'movie');
    genreBloc.add(GenreIndexEvent());

    moviesBloc = MoviesBloc(listType: 'byGenre', genre: genreSelected);
    moviesBloc.add(MoviesIndexEvent());
  }

  @override
  void dispose() {
    genreBloc.close();
    moviesBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      bloc: moviesBloc,
      builder: (context, MoviesState state) {
        if (state is MoviesLoadingState) {
          return Container(
              margin: const EdgeInsets.only(top: 30),
              child: const MoviesByGenreLoadingSkeletonWidget(),
            );
        }

        if (state is MoviesIndexState) {
          return Column(
              children: [
                _header(),
                SizedBox(
                  height: 200,
                  child: MoviesByGenreCarouselWidget(movies: state.movies),
                ),
              ],
            );
        }

        if (state is MoviesErrorState) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: Text(
              state.errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          );
        }

        return Container();
      },
    );
  }

  Widget _header() {
    return Container(
      padding: const EdgeInsets.only(
        top: 30,
        left: 5,
        right: 5,
        bottom: 10
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Por gênero',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white
            ),
          ),
          BlocBuilder<GenreBloc, GenreState>(
            bloc: genreBloc,
            builder: (context, GenreState state) {
              if (state is GenreIndexState) {
                return DropdownButton<String>(
                  value: genreSelected,
                  elevation: 16,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 1, 180, 228),
                    fontSize: 22
                  ),
                  underline: Container(
                    height: 1,
                    color: Colors.transparent,
                  ),
                  onChanged: (String? genre) {
                    setState(() {
                      genreSelected = genre;
                      moviesBloc.genre = genre;
                      moviesBloc.add(MoviesLoadingEvent());
                      
                      if (moviesBloc.state.movies.isNotEmpty) {
                        moviesBloc.add(MoviesIndexEvent());
                      }
                    });
                  },
                  items: state.genres.map<DropdownMenuItem<String>>((Genre genre) {
                    return DropdownMenuItem<String>(
                      value: genre.id.toString(),
                      child: Text(genre.name),
                    );
                  }).toList(),
                );
              }

              if (state is GenreErrorState) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: Text(
                    state.errorMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                );
              }

              return Container();
            },
          ),
          const Text(
            'Ver mais',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70
            ),
          ),
        ],
      )
    );
  }
}