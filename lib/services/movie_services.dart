import 'package:movieapp/data/movie.dart';
import 'package:movieapp/services/api.dart';

class MovieServices {
  static String _entity = '/movie';

  static Future<List<Movie>> getMovies() async {
    Map<String, dynamic> res = await API.get(_entity + '/popular');
    List<Movie> movies = [];
    for (Map<String, dynamic> movie in res['results']) {
      movies.add(Movie.fromJson(movie));
    }
    return movies;
  }
}
