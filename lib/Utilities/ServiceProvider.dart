import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:tourguide/Utils/userPrefes.dart';

class ServiceProvider {
  static String baseURL = "http://3.110.29.31:8090";
  static String signUPUrl = "/api/guide/sign-up";
  static String signInUrl = "/api/guide/sign-in-with-mobile";
  static String verifyOtpUrl = "/api/guide/verify-otp";
  static String reSendOtpUrl = "/api/guide/resend-otp";
  static String editProfileUrl = "/api/guide/profile-update";
  static String profileUrl = "/api/guide/edit-profile";
  static String chooseLanguageUrl = "/api/guide/choose-language";
  static String addScheduleUrl = "/api/guide/add-schedule";
  static String baseURLImages = "https://api/";

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
        'Authorization': 'Bearer ${UserPrefs.userToken}',
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

      responseNew = json.decode(response.body);

      if (kDebugMode) {
        print(response.body);
      }

      var jsonData = json.decode(response.body);
      if (kDebugMode) {
        print(jsonData['message']);
      }
      if (response.statusCode == 200) {
        json.decode(response.body);
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

  static Future<Response?> apiMultiPartsCall(
      String end_point,
      dynamic fullName,
      List<dynamic> countyName,
      dynamic phoneNumber,
      dynamic email,
      List<XFile> profileImage,
      List<XFile> bannerImage,
      BuildContext context) async {
    http.Response? responseNew;
    try {
      await EasyLoading.show(
        // status: 'Wait',
        // indicator: Image.asset(
        //   "images/loading_anim.gif",
        //   height: 60.0,
        //   width: 30.0,
        // ),
        maskType: EasyLoadingMaskType.black,
      );
      var uri = Uri.parse(baseURL + end_point);
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${UserPrefs.userToken}'
      });
      // if (profileImage.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath(
          "profile_img", profileImage[0].path));
      request.files.add(
          await http.MultipartFile.fromPath("banner_img", bannerImage[0].path));
      // }
      request.fields['full_name'] = fullName;
      request.fields['language'] = countyName.toString();
      request.fields['mobile_number'] = phoneNumber;
      request.fields['email'] = email;
      var response = await request.send();
      if (kDebugMode) {
        print('request$response');
      }
      var res = await http.Response.fromStream(response);
      final jsonData = jsonDecode(res.body);
      await EasyLoading.dismiss();
      if (response.statusCode == 200) {
        responseNew = res;
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
      await EasyLoading.dismiss();
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
  }


  // static Future apiPostWTkn(){
  //
  // }


}
