import 'dart:convert';

import 'package:allohuggy/View_Model_Data/user_prefences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../Model/user_model.dart';
import '../Repositery/common_auth_repositery.dart';
import '../Utilities/Routes/routes.dart';
import '../Utilities/utils.dart';

class CommonAuthViewModel with ChangeNotifier {
  final _myRepo = CommonAuthRepo();
  bool _loading = false;
  bool get loading =>_loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }
/// client
  Future<void> registerClient(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.registerClientApi(data).then((value) {
      setLoading(false);
      final userPrefences = Provider.of<UserPrefences>(context,listen: false);
      userPrefences.saveUserData(UserModel(token: value['token'].toString()));
      Utils.flushBarErrorMessage('Register Successfully', context);
      GoRouter.of(context).pushNamed(MyAppRouteConstants.registerOtpScreen);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode){
        print(' new error is  ${error!.toString()}');
      }
    });
  }
  Future<void> loginClient(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginClientApi(data).then((value) {
      setLoading(false);
      final userPrefences = Provider.of<UserPrefences>(context,listen: false);
      userPrefences.saveUserData(UserModel(token: value['token'].toString()));
      Utils.flushBarErrorMessage('Login Successfully', context);
      // print("sssss"+value['data'].toString());

      // GoRouter.of(context).pushNamed(MyAppRouteConstants.registerOtpScreen);
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
  Future<void> otpClient(dynamic data, String otptype, BuildContext context) async {
    setLoading(true);
    _myRepo.otpClientApi(data, otptype).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage('OTP Verified', context);
      GoRouter.of(context).pushNamed(MyAppRouteConstants.registerCompleteScreen);
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

  /// service provider
  Future<void> registerServiceProviders(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.registerClientApi(data).then((value) {
      setLoading(false);
      final userPrefences = Provider.of<UserPrefences>(context,listen: false);
      userPrefences.saveUserData(UserModel(token: value['token'].toString()));
      Utils.flushBarErrorMessageOnSuccess('Register Successfully', context);
      GoRouter.of(context).pushNamed(MyAppRouteConstants.registerOtpScreen);
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

  Future<void> loginServiceProvider(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginServiceProviderApi(data).then((value) {
      setLoading(false);
      /*final userPrefences = Provider.of<UserPrefences>(context,listen: false);
      userPrefences.saveUserData(UserModel(token: value['token'].toString()));*/
      Utils.flushBarErrorMessage('Login Successfully', context);
      // print("sssss"+value['data'].toString());
      // GoRouter.of(context).pushNamed(MyAppRouteConstants.registerOtpScreen);
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

