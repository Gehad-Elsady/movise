import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'package:movise/Bloc/Search/search-states.dart';
import 'package:movise/Models/search_model.dart';
import 'package:movise/constants/constants.dart';

class SearchCubit extends Cubit<SearchStates> {
  List<SearchModel> movies = [];
  SearchCubit() : super(SearchInitialState());
  static SearchCubit get(context) => BlocProvider.of(context);

  Future<void> searchMovies({required String movieName}) async {
    try {
      emit(SearchLoadingState());
      Uri url = Uri.https(Constants.BaseUrl,
          "/3/search/movie?query=home&include_adult=false&language=en-US&page=1");
      Response response = await http.get(
          Uri.parse(
              'https://api.themoviedb.org/3/search/movie?query=$movieName&include_adult=false&language=en-US&page=1'),
          headers: {"Authorization": Constants.Token});
      var json = jsonDecode(response.body);
      for (var movie in json['results']) {
        movies.add(SearchModel.fromJson(movie));
      }
      emit(SearchSuccessState());
    } catch (e) {
      emit(SearchErrorState());
    }
  }

  Future<void> gogo() async {
    movies.clear();
    searchMovies(movieName: "Gangs of New York");
  }
}
