import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/models/movie.dart';

class MoviesUpcomingCarousel extends StatelessWidget {
  final List<Movie> movies;

  const MoviesUpcomingCarousel({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        viewportFraction: .35,
        autoPlay: false,
        enlargeCenterPage: false,
        disableCenter: false,
      ),
      items: movies.map((Movie movie) => Builder(
        builder: (context) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(movie.poster, fit: BoxFit.fill),
          ),
        ),
      )).toList(),
    );
  }
}