import 'package:flutter_dotenv/flutter_dotenv.dart';

class Api {
  static const String baseUrl = 'https://api.themoviedb.org/3';

  static final String defaultParams = 'api_key=${dotenv.env['API_KEY']}&language=${dotenv.env['LANG']}';
}