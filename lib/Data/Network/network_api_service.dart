import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../Response/app_exception.dart';
import 'base_api_service.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getApiResponse(String? url) async {
    dynamic responseJson;
    try {
      var response =
          await http.get(Uri.parse(url!)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      FetchExceptionData('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future postApiResponse(String? url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await http
          .post(Uri.parse(url!), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      FetchExceptionData('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 404:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchExceptionData(
            'Error occurred while communicating with server with status code${response.statusCode}');
    }
  }
}
