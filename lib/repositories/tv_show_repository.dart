import 'dart:convert';

import 'package:http/http.dart';
import 'package:movies/http/api.dart';
import 'package:movies/models/tv_show.dart';

class TvShowRepository {
  Future<List<TvShow>> trending() async {
    Response response = await get(
      Uri.parse('${Api.baseUrl}/trending/tv/week?${Api.defaultParams}')
    );

    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar os dados do servidor.');
    }

    return json.decode(response.body)['results']
        .map<TvShow>((video) => TvShow.fromJson(video))
        .toList();
  }
}