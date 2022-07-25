import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/blocs/movies/movies_bloc.dart';
import 'package:movies/blocs/movies/movies_event.dart';
import 'package:movies/blocs/movies/movies_state.dart';
import 'package:movies/pages/widgets/movies_trending/movies_trending_carousel.dart';
import 'package:movies/pages/widgets/movies_trending/movies_trending_loading_skeleton.dart';

class MoviesTrendingIndexWidget extends StatefulWidget {
  const MoviesTrendingIndexWidget({Key? key}) : super(key: key);

  @override
  State<MoviesTrendingIndexWidget> createState() => _MoviesTrendingIndexWidgetState();
}

class _MoviesTrendingIndexWidgetState extends State<MoviesTrendingIndexWidget> {

  late final MoviesBloc trendingBloc;

  @override
  void initState() {
    super.initState();

    trendingBloc = MoviesBloc(listType: 'trending', genre: null);
    trendingBloc.add(MoviesIndexEvent());
  }

  @override
  void dispose() {
    trendingBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      height: 500,
      child: BlocBuilder<MoviesBloc, MoviesState>(
        bloc: trendingBloc,
        builder: (context, MoviesState state) {
          if (state is MoviesLoadingState) {
            return const TrendingLoadingSkeleton();
          }

          if (state is MoviesIndexState) {
            return MoviesTrendingCarousel(movies: state.movies);
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
      ),
    );
  }
}