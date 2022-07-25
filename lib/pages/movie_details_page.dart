import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/blocs/movie/movie_bloc.dart';
import 'package:movies/blocs/movie/movie_event.dart';
import 'package:movies/blocs/movie/movie_state.dart';

class MovieDetailsPage extends StatefulWidget {
  final int id;

  const MovieDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  
  late final MovieBloc movieBloc;

  @override
  void initState() {
    super.initState();

    movieBloc = MovieBloc(id: widget.id);
    movieBloc.add(MovieLoadedEvent());
  }

  @override
  void dispose() {
    movieBloc.close();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      bloc: movieBloc,
      builder: (context, MovieState state) {
        if (state is MovieLoadedState && state.movie != null) {
          return Image.network(state.movie?.poster ?? '', fit: BoxFit.fill);
        }
        return Container();
      },
    );
  }
}