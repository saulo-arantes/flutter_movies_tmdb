import 'dart:convert';

import 'package:http/http.dart';
import 'package:movies/exceptions/server_error_exception.dart';
import 'package:movies/http/api.dart';
import 'package:movies/models/genre.dart';

class GenreController {
  Future<List<Genre>> index(String type) async {
    Response response = await get(
      Uri.parse('${Api.baseUrl}/genre/$type/list?${Api.defaultParams}')
    );

    if (response.statusCode != 200) {
      throw ServerErrorException(
        message: 'Falha ao carregar os dados do servidor.'
      );
    }

    return json.decode(response.body)['genres']
      .map<Genre>((video) => Genre.fromJson(video))
      .toList();
  }
}