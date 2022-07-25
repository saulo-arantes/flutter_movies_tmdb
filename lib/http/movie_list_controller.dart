import 'dart:convert';

import 'package:http/http.dart';
import 'package:movies/exceptions/server_error_exception.dart';
import 'package:movies/http/api.dart';
import 'package:movies/models/movie.dart';

class MovieListController {
  Future<List<Movie>> trending() async {
    Response response = await get(
      Uri.parse('${Api.baseUrl}/trending/movie/week?${Api.defaultParams}')
    );

    if (response.statusCode != 200) {
      throw ServerErrorException(
        message: 'Falha ao carregar os dados do servidor.'
      );
    }

    return json.decode(response.body)['results']
      .map<Movie>((video) => Movie.fromJson(video))
      .toList();
  }

  Future<List<Movie>> upcoming() async {
    Response response = await get(
      Uri.parse('${Api.baseUrl}/movie/upcoming?${Api.defaultParams}')
    );

    if (response.statusCode != 200) {
      throw ServerErrorException(
        message: 'Falha ao carregar os dados do servidor.'
      );
    }

    return json.decode(response.body)['results']
      .map<Movie>((video) => Movie.fromJson(video))
      .toList();
  }

  Future<List<Movie>> topRated() async {
    Response response = await get(
      Uri.parse('${Api.baseUrl}/movie/top_rated?${Api.defaultParams}')
    );

    if (response.statusCode != 200) {
      throw ServerErrorException(
        message: 'Falha ao carregar os dados do servidor.'
      );
    }

    return json.decode(response.body)['results']
      .map<Movie>((video) => Movie.fromJson(video))
      .toList();
  }

  Future<List<Movie>> byGenre({String? genre}) async {
    Response response = await get(
      Uri.parse('${Api.baseUrl}/discover/movie?${Api.defaultParams}&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres=$genre&with_watch_monetization_types=flatrate')
    );

    if (response.statusCode != 200) {
      throw ServerErrorException(
        message: 'Falha ao carregar os dados do servidor.'
      );
    }

    return json.decode(response.body)['results']
      .map<Movie>((video) => Movie.fromJson(video))
      .toList();
  }
}