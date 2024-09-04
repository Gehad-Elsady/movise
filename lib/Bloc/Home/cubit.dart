import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'package:movise/Bloc/Home/states.dart';
import 'package:movise/Models/RecomendedMoviesResponse%20.dart';
import 'package:movise/Models/popularMoviesResponse%20.dart';
import 'package:movise/Models/upconingMoviesResponse.dart';
import 'package:movise/constants/constants.dart';

class HomeCubit extends Cubit<HomeStates> {
  static HomeCubit get(context) => BlocProvider.of(context);
  HomeCubit() : super(HomeInitialState());
  popularMoviesResponse? popularResponse;
  upcomingMoviesResponse? upcomingResponse;
  RecommendedMoviesResponse? recommendedResponse;
  Future<void> getPopularMovies() async {
    try {
      emit(HomeGetPopularMoviesLoadingState());
      Uri url = Uri.https(Constants.BaseUrl, "/3/movie/popular");
      Response response =
          await http.get(url, headers: {"Authorization": Constants.Token});

      var json = jsonDecode(response.body);
      popularResponse = popularMoviesResponse.fromJson(json);
      emit(HomeGetPopularMoviesSuccessState());
    } catch (e) {
      emit(HomeGetPopularMoviesErrorState());
      print(e);
    }
  }

  Future<void> getUpcomingMovies() async {
    try {
      emit(HomeGetUpcomingMoviesLoadingState());
      Uri url = Uri.https(Constants.BaseUrl, "/3/movie/upcoming");
      Response response =
          await http.get(url, headers: {"Authorization": Constants.Token});

      var json = jsonDecode(response.body);
      upcomingResponse = upcomingMoviesResponse.fromJson(json);
      emit(HomeGetUpcomingMoviesSuccessState());
    } catch (e) {
      emit(HomeGetUpcomingMoviesErrorState());
      print(e);
    }
  }

  Future<void> getRecommendedMovies() async {
    try {
      emit(HomeGetRecommendedMoviesLoadingState());
      Uri url = Uri.https(Constants.BaseUrl, "/3/movie/top_rated");
      Response response =
          await http.get(url, headers: {"Authorization": Constants.Token});

      var json = jsonDecode(response.body);
      recommendedResponse = RecommendedMoviesResponse.fromJson(json);
      emit(HomeGetRecommendedMoviesSuccessState());
    } catch (e) {
      emit(HomeGetRecommendedMoviesErrorState());
      print(e);
    }
  }
}
