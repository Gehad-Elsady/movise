import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'package:movise/Bloc/browes/browes-states.dart';
import 'package:movise/Models/SpecificCategoryResponse.dart';
import 'package:movise/constants/constants.dart';

class BrowseCubit extends Cubit<BrowseStates> {
  static BrowseCubit get(context) => BlocProvider.of(context);
  BrowseCubit() : super(BrowseInitialState());
  SpecificCategoryResponse? categoryResponse;

  Future<void> getSpecificCategory(
      {required String id, required String page}) async {
    try {
      emit(BrowseLoadingState());
      Uri url = Uri.https(Constants.BaseUrl, "/3/discover/movie",
          {"with_genres": id, "page": page});
      Response response =
          await http.get(url, headers: {"Authorization": Constants.Token});

      var json = jsonDecode(response.body);
      categoryResponse = SpecificCategoryResponse.fromJson(json);
      emit(BrowseSuccessState());
    } catch (e) {
      emit(BrowseErrorState());
    }
  }
}
