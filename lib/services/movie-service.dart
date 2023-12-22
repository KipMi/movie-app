import 'package:dio/dio.dart';
import 'package:uts_2072006/models/movie-detail.dart';
import 'package:uts_2072006/models/movie.dart';

abstract class MovieService {
  static Future<Movie?> getMovieByKeyword(String keyword) async {
    try {
      var response =
          await Dio().get('https://search.imdbot.workers.dev/?q=$keyword');

      if (response.statusCode == 200) {
        return Movie(imdb_id: response.data['description'][0]['#IMDB_ID'], year: response.data['description'][0]['#YEAR'], actors: response.data['description'][0]['#ACTORS'], title: response.data['description'][0]['#TITLE'], keyword: keyword);
      }

      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<MovieDetail?> getMovieDetail(String id) async {
    try {
      var response = await Dio().get('https://search.imdbot.workers.dev/?tt=$id');

      if (response.statusCode == 200) {
        return MovieDetail(id: id, image: response.data['short']['image'], description: response.data['short']['description']);
      }
    }
    catch (e) {
      throw Exception(e.toString());
    }
  }
}
