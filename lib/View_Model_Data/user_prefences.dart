import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/user_model.dart';

class UserPrefences with ChangeNotifier{

  Future<bool> saveUserData(UserModel user)async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    return true;
  }

  Future<UserModel> getUserData()async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    return UserModel(
        token: token
    );
  }

  Future<bool> remove()async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }

  static String? languageType = "";
  static String? feedType = "";
  static double lat = 0.0;
  static double lng = 0.0;




}