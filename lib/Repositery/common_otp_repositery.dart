import '../Data/Network/base_api_service.dart';
import '../Data/Network/network_api_service.dart';

class CommonOtpRepo{
  final BaseApiService _apiService = NetworkApiService();


  // Future<dynamic> clientOtpByPhoneApi(dynamic data) async {
  //   try {
  //     dynamic response = await _apiService.postApiResponse(ApiUrl.baseurl+ApiUrl.registerClient, data);
  //     return response;
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }



}