import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class API {
  static Dio _server = Dio();
  static String _baseUrl = 'https://api.themoviedb.org/3';

  static Future<Map<String, dynamic>> get(String url) async {
    if (dotenv.env['API_KEY'] == null) {
      // If no API key is set, then throw Error
      throw Exception('No API Key!');
    } else {
      String key = dotenv
          .env['API_KEY']!; //! means nullable that is asserted to be not null
      Response res =
          await _server.get(_baseUrl + url, queryParameters: {'api_key': key});
      return res.data;
    }
  }

  static String getStatic(String url) {
    return 'https://image.tmdb.org/t/p/w500' + url;
  }
}
