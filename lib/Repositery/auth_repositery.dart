import '../Data/Network/base_api_service.dart';
import '../Data/Network/network_api_service.dart';
import '../Resources/api_url.dart';

class AuthRepo{
  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(ApiUrl.loginUrl, data);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
      await _apiService.postApiResponse(ApiUrl.registerUrl, data);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}