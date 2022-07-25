import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/blocs/movies/movies_bloc.dart';
import 'package:movies/blocs/movies/movies_event.dart';
import 'package:movies/blocs/movies/movies_state.dart';
import 'package:movies/pages/widgets/movies_upcoming/movies_upcoming_carousel.dart';
import 'package:movies/pages/widgets/movies_upcoming/movies_upcoming_loading_skeleton.dart';

class MoviesUpcomingIndexWidget extends StatefulWidget {
  const MoviesUpcomingIndexWidget({Key? key}) : super(key: key);

  @override
  State<MoviesUpcomingIndexWidget> createState()
    => _MoviesUpcomingIndexWidgetState();
}

class _MoviesUpcomingIndexWidgetState extends State<MoviesUpcomingIndexWidget> {
  late final MoviesBloc moviesBloc;

  @override
  void initState() {
    super.initState();

    moviesBloc = MoviesBloc(listType: 'upcoming', genre: null);
    moviesBloc.add(MoviesIndexEvent());
  }

  @override
  void dispose() {
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
            child: const MoviesUpcomingLoadingSkeleton(),
          );
        }

        if (state is MoviesIndexState) {
          return Column(
            children: [
              _header(),
              SizedBox(
                height: 200,
                child: MoviesUpcomingCarousel(movies: state.movies),
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
        children: const [
          Text(
            'Em breve',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white
            ),
          ),
          Text(
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