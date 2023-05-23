import 'package:flutter/material.dart';
import '../Data/Response/api_response.dart';
import '../Model/category_model.dart';
import '../Repositery/get_category_data(s).dart';


class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepo();
  ApiResponse<MoviewModel> moviesList = ApiResponse.loading();

  setMovieList(ApiResponse<MoviewModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesData() async {
    setMovieList(ApiResponse.loading());
    _myRepo.getMovieData().then((value) {
      setMovieList(ApiResponse.complete(value));
    }).onError((error, stackTrace) {
      setMovieList(ApiResponse.error(error.toString()));
    });
  }
}
