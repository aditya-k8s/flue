

import '../Data/Network/base_api_service.dart';
import '../Data/Network/network_api_service.dart';
import '../Resources/api_url.dart';

class CommonAuthRepo{
  final BaseApiService _apiService = NetworkApiService();


///client
  Future<dynamic> registerClientApi(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(ApiUrl.baseurl+ApiUrl.registerClient, data);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<dynamic> loginClientApi(dynamic data) async {
    try {
      dynamic response =
      await _apiService.postApiResponse(ApiUrl.baseurl+ApiUrl.logniClient, data);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<dynamic> otpClientApi(dynamic data, String optType) async {
    try {
      dynamic response =
      await _apiService.postApiResponse(ApiUrl.baseurl+(optType=="sms"?ApiUrl.verifyWithSMS:ApiUrl.verifyWithEmail), data);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }



  /// service Provider
  Future<dynamic> registerServiceProviderApi(dynamic data) async {
    try {
      dynamic response =
      await _apiService.postApiResponse(ApiUrl.baseurl+ApiUrl.registerServiceProvider, data);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<dynamic> loginServiceProviderApi(dynamic data) async {
    try {
      dynamic response =
      await _apiService.postApiResponse(ApiUrl.baseurl+ApiUrl.loginServiceProvider, data);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }


}
