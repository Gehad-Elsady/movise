import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movise/Models/search_model.dart';
import 'package:movise/constants/constants.dart';

class ApiManager {
  static Future<List<SearchModel>> searchMovies(
      {required String movieName}) async {
    Uri url = Uri.https(Constants.BaseUrl,
        "/3/search/movie?query=home&include_adult=false&language=en-US&page=1");
    Response response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/search/movie?query=$movieName&include_adult=false&language=en-US&page=1'),
        headers: {"Authorization": Constants.Token});

    var json = jsonDecode(response.body);
    List<SearchModel> movies = [];
    for (var movie in json['results']) {
      movies.add(SearchModel.fromJson(movie));
    }

    return movies;
  }
}
