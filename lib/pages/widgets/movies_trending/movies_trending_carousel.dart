import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/models/movie.dart';
import 'package:movies/pages/movie_details_page.dart';

class MoviesTrendingCarousel extends StatelessWidget {
  final List<Movie> movies;

  const MoviesTrendingCarousel({
    Key? key,
    required this.movies
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 480.0,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(seconds: 3),
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 5)
      ),
      items: movies.map((Movie movie) => Builder(
        builder: (context) => SizedBox(
          width: 400,
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailsPage(id: movie.id),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(movie.poster, fit: BoxFit.fill),
            ),
          ),
        ),
      )).toList(),
    );
  }
}