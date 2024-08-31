import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movise/Models/CategoryResponse.dart';
import 'package:movise/Models/RecomendedMoviesResponse%20.dart';
import 'package:movise/Models/SpecificCategoryResponse.dart';
import 'package:movise/constants.dart';
import 'package:movise/Models/popularMoviesResponse%20.dart';
import 'package:movise/Models/upconingMoviesResponse.dart';

class ApiManager {
  static Future<popularMoviesResponse> getPopularMovies() async {
    Uri url = Uri.https(Constants.BaseUrl, "/3/movie/popular");
    Response response =
        await http.get(url, headers: {"Authorization": Constants.Token});

    var json = jsonDecode(response.body);
    popularMoviesResponse popularResponse =
        popularMoviesResponse.fromJson(json);

    return popularResponse;
  }

  static Future<upcomingMoviesResponse> getUpcomingMovies() async {
    Uri url = Uri.https(Constants.BaseUrl, "/3/movie/upcoming");
    Response response =
        await http.get(url, headers: {"Authorization": Constants.Token});

    var json = jsonDecode(response.body);
    upcomingMoviesResponse upcomingResponse =
        upcomingMoviesResponse.fromJson(json);

    return upcomingResponse;
  }

  static Future<RecommendedMoviesResponse> getRecommendedMovies() async {
    Uri url = Uri.https(Constants.BaseUrl, "/3/movie/top_rated");
    Response response =
        await http.get(url, headers: {"Authorization": Constants.Token});

    var json = jsonDecode(response.body);
    RecommendedMoviesResponse recommendedResponse =
        RecommendedMoviesResponse.fromJson(json);

    return recommendedResponse;
  }

  static Future<CategoryResponse> getMoviesCategory() async {
    Uri url = Uri.https(Constants.BaseUrl, "/3/genre/movie/list");
    Response response =
        await http.get(url, headers: {"Authorization": Constants.Token});

    var json = jsonDecode(response.body);
    CategoryResponse categoryResponse = CategoryResponse.fromJson(json);

    return categoryResponse;
  }

  static Future<SpecificCategoryResponse> getSpecificCategory(
      {required String id, required String page}) async {
    Uri url = Uri.https(Constants.BaseUrl, "/3/discover/movie",
        {"with_genres": id, "page": page});
    Response response =
        await http.get(url, headers: {"Authorization": Constants.Token});

    var json = jsonDecode(response.body);
    SpecificCategoryResponse categoryResponse =
        SpecificCategoryResponse.fromJson(json);

    return categoryResponse;
  }
}
