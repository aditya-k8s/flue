import 'package:allohuggy/View_Model_Data/user_prefences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../Model/user_model.dart';
import '../Repositery/auth_repositery.dart';
import '../Utilities/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepo();
  bool _loading = false;
  bool get loading =>_loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      final userPrefences = Provider.of<UserPrefences>(context,listen: false);
      userPrefences.saveUserData(UserModel(token: value['token'].toString()));
      Utils.flushBarErrorMessage('Login Successfully', context);
     // Navigator.pushNamed(context, RouteName.home);
      if(kDebugMode){
        print(value.toString());
      }

    }).onError((error, stackTrace) {
      setLoading(false);
      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.registerApi(data).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage('Login Successfully', context);
     // Navigator.pushNamed(context, RouteName.home);
      if(kDebugMode){
        print(value.toString());
      }

    }).onError((error, stackTrace) {
      setLoading(false);
      if(kDebugMode){
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
