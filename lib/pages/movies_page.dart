import 'package:flutter/material.dart';
import 'package:movies/pages/widgets/movies_by_genre/movies_by_genre_index.dart';
import 'package:movies/pages/widgets/movies_top_rated/movies_top_rated_index.dart';
import 'package:movies/pages/widgets/movies_trending/movies_trending_index.dart';
import 'package:movies/pages/widgets/movies_upcoming/movies_upcoming_index.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          MoviesTrendingIndexWidget(),
    
          MoviesUpcomingIndexWidget(),

          MoviesTopRatedIndexWidget(),

          MoviesByGenreIndexWidget(),
        ],
      ),
    );
  }
}