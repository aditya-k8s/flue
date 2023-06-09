import 'dart:convert';
import 'package:allohuggy/View_Model_Data/user_prefences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ServiceProvider {
  static String baseURL = "http://3.110.29.31:8090/api/admin";
  static String signInUrl = "/register";

  static Future apiGetCall(String end_pont, BuildContext context) async {
    await EasyLoading.show(
      // status: 'Wait',
      // indicator: Image.asset(
      //   "images/loading_anim.gif",
      //   height: 60.0,
      //   width: 30.0,
      // ),
      maskType: EasyLoadingMaskType.black,
    );
    Response? responseNew;

    try {
      var uri = Uri.parse(baseURL + end_pont);
      var response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer',
      });
      responseNew = response;
      var jsonData = jsonDecode(response.body);
      if (kDebugMode) {
        print(jsonData['error']);
        print(response.body);
      }
      if (response.statusCode == 200) {
        json.decode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(jsonData['error']),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(30.0),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
      } else if (response.statusCode == 401 || response.statusCode == 405) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("You need to login again."),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(30.0),
            backgroundColor: Colors.red.shade700,
            duration: const Duration(seconds: 2),
          ),
        );

        if (kDebugMode) {
          print(response.statusCode);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(jsonData['error']),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(30.0),
            backgroundColor: Colors.red.shade700,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Please try again..!"),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(30.0),
          backgroundColor: Colors.red.shade700,
          duration: const Duration(seconds: 2),
        ),
      );
    }
    await EasyLoading.dismiss();
    return responseNew;
  }

  static Future apiPostCall(String end_pont, var formData, BuildContext context) async {
    await EasyLoading.show(
      // status: 'Wait',
      // indicator: Image.asset(
      //   "assets/loading_anim.gif",
      //   height: 60.0,
      //   width: 30.0,
      // ),
      maskType: EasyLoadingMaskType.black,
    );
    dynamic responseNew;

    try {
      var uri = Uri.parse(baseURL + end_pont);
      var response = await http.post(
        uri,
        body: formData,
      );

      if (kDebugMode) {
        print(response.body);
      }

      var jsonData = json.decode(response.body);
      if (kDebugMode) {
        print(jsonData['message']);
      }
      if (response.statusCode == 201 || response.statusCode == 200) {
        // json.decode(response.body);
        responseNew = json.decode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(jsonData['message']),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(30.0),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
      } else if (response.statusCode == 401 || response.statusCode == 405) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("You need to login again."),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(30.0),
            backgroundColor: Colors.red.shade700,
            duration: const Duration(seconds: 2),
          ),
        );

        if (kDebugMode) {
          print(response.statusCode);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(jsonData['message']),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(30.0),
            backgroundColor: Colors.red.shade700,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Please try again..!"),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(30.0),
          backgroundColor: Colors.red.shade700,
          duration: const Duration(seconds: 2),
        ),
      );
    }
    await EasyLoading.dismiss();
    return responseNew;
  }

}
