import 'dart:convert';

import 'package:http/http.dart';
import 'package:movies/exceptions/server_error_exception.dart';
import 'package:movies/http/api.dart';
import 'package:movies/models/movie.dart';

class MovieController {
  Future<Movie> getMovie({required int id}) async {
    Response response = await get(
      Uri.parse('${Api.baseUrl}/movie/$id?${Api.defaultParams}')
    );

    if (response.statusCode != 200) {
      throw ServerErrorException(
        message: 'Falha ao carregar os dados do servidor.'
      );
    }

    return Movie.fromJson(json.decode(response.body));
  }
}