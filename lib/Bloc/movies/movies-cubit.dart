import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'package:movise/Bloc/movies/movise-states.dart';
import 'package:movise/Models/MoviesDetelisRespons%20.dart';
import 'package:movise/Models/SimilarDetelisRespons.dart';
import 'package:movise/Models/TrailerDetelisRespons%20.dart';
import 'package:movise/constants/constants.dart';

class MoviesCubit extends Cubit<MoviesStates> {
  static MoviesCubit get(context) => BlocProvider.of(context);
  MoviesCubit() : super(MoviesInitialState());

  SimilarDetelisRespons? moviesRespons;

  MoviesDetelisRespons? moviesResponsD;
  TrailerDetailsResponse? trailerRespons;

  Future<void> getSimilarMovie({required int id}) async {
    try {
      emit(MoviesLoadingState());
      Uri url = Uri.https(Constants.BaseUrl, "/3/movie/$id/similar");
      Response response =
          await http.get(url, headers: {"Authorization": Constants.Token});

      var json = jsonDecode(response.body);
      moviesRespons = SimilarDetelisRespons.fromJson(json);
      emit(MoviesSuccessState());
    } catch (e) {
      emit(MoviesErrorState());
    }
  }

  Future<void> getMovieDetelis({required int id}) async {
    try {
      emit(MoviesDetailsLoadingState());
      Uri url = Uri.https(Constants.BaseUrl, "/3/movie/$id");
      Response response =
          await http.get(url, headers: {"Authorization": Constants.Token});

      var json = jsonDecode(response.body);
      moviesResponsD = MoviesDetelisRespons.fromJson(json);
      emit(MoviesDetailsSuccessState());
    } catch (e) {
      emit(MoviesDetailsErrorState());
    }
  }

  Future<void> getTrailerMovie({required int id}) async {
    try {
      emit(TrailerLoadingState());
      Uri url = Uri.https(Constants.BaseUrl, "/3/movie/$id/videos");
      Response response =
          await http.get(url, headers: {"Authorization": Constants.Token});

      var json = jsonDecode(response.body);
      trailerRespons = TrailerDetailsResponse.fromJson(json);
      emit(TrailerSuccessState());
    } catch (e) {
      emit(TrailerErrorState());
    }
  }
}
