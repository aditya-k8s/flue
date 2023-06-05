import 'dart:convert';
import 'dart:io';
import 'package:allohuggy/Utilities/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../Response/app_exception.dart';
import 'base_api_service.dart';
import 'package:flutter/material.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getApiResponse(String? url) async {
    dynamic responseJson;
    try {
      var response =
          await http.get(Uri.parse(url!)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response, '');
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
          .timeout(const Duration(seconds: 30));
      var jsonData = jsonDecode(response.body);
      responseJson = returnResponse(response, jsonData['message']);
    } on SocketException {
      FetchExceptionData('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response, String dynamicError) {
    switch (response.statusCode) {
      case 200:
        {

          dynamic responseJson = json.decode(response.body);
              // dynamic responseJson = jsonDecode(response.body);
          // print("ffff"+responseJson['success']);
          if (responseJson['success'] == false) {
            print("200 if");
          throw  FetchExceptionData(responseJson['message'].toString());
          } else {
            if (kDebugMode) {
              print("200 else");
            }
            return responseJson;
          }
        }
      case 404:
        dynamic responseJson = jsonDecode(response.body);
        if (kDebugMode) {
          print("404");
        }
        return responseJson;
      default:
        if(kDebugMode){
          print("default");
        }
        throw FetchExceptionData(dynamicError.toString());
    }
  }
}
