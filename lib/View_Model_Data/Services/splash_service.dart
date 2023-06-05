import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Model/user_model.dart';
import '../../Utilities/Routes/routes.dart';
import '../user_prefences.dart';


class SplashServices {
  Future<UserModel> getUserData() => UserPrefences().getUserData();

  void checkAuthentication(BuildContext context) async{
    // await Future.delayed(const Duration(seconds: 3));
    //  Navigator.of(context).pushNamed(RouteName.languageTypeScreen);
    // getUserData().then((value) async {
    //   if (value.token == 'null' || value.token == "") {
    //     await Future.delayed(const Duration(seconds: 3));
    //     // Navigator.of(context).pushNamed(RouteName.splash);
    //   } else {
    //     await Future.delayed(const Duration(seconds: 3));
    //     // Navigator.of(context).pushNamed(RouteName.languageTypeScreen);
    //   }
    // }).onError((error, stackTrace) {
    //   if (kDebugMode) {
    //     print(error.toString());
    //   }
    // });
  }

  void getToken(BuildContext context)async{
    SharedPreferences preps = await SharedPreferences.getInstance();
    preps.getString('feedType');
    preps.getString('lat');
    preps.getString('lng');
  }


}