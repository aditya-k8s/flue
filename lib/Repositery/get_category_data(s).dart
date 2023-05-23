import '../Data/Network/base_api_service.dart';
import '../Data/Network/network_api_service.dart';
import '../Model/category_model.dart';
import '../Resources/api_url.dart';

class HomeRepo{
  final BaseApiService _apiService = NetworkApiService();

  Future<MoviewModel> getMovieData() async {
    try {
      dynamic response =
      await _apiService.getApiResponse(ApiUrl.getHomeScreenData);
      return response = MoviewModel.fromJson(response);
    } catch (e) {
      throw e.toString();
      // if(kDebugMode){
      //   print(e.toString());
      // }
    }
  }
}
