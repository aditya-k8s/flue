import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'Data/Blocs/Localization_Bloc/App_Localization/localization_setup.dart';
import 'Data/Blocs/Localization_Bloc/local_cubit.dart';
import 'Data/Blocs/Localization_Bloc/local_state.dart';
import 'MultiProvider_State/local_provider.dart';
import 'Resources/colors.dart';
import 'Utilities/Routes/routes.dart';
import 'View_Model_Data/common_register_auth_model.dart';
import 'View_Model_Data/user_prefences.dart';




Future<void> main() async {
  runApp(const MyApp());
  var prefs = await SharedPreferences.getInstance();
  UserPrefences.languageType = prefs.getString("languageType");
  if (kDebugMode) {
    print("App Language = ${UserPrefences.languageType}");
  }
  if (UserPrefences.languageType == null) {
    UserPrefences.languageType = "en";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('languageType', "en");
  }
  prefs.getString('feedType');
  print("Feed type is ${UserPrefences.feedType}");
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MultiBlocProvider(
          providers: BlocProviders.providers,
          child:BlocBuilder<LocalCubit , LocaleState>(
            buildWhen: (previousState,currentState)=>
                previousState != currentState,
            builder: (_,localeState){
              return  MultiProvider(
                providers: [
                  ChangeNotifierProvider(create: (_) => CommonAuthViewModel()),
                  ChangeNotifierProvider(create: (_) => UserPrefences())
                ],
                child: MaterialApp.router(
                  title: "allohuggy",
                  debugShowCheckedModeBanner: false,
                  routeInformationParser: MyAppRouter.routers.routeInformationParser,
                  routerDelegate: MyAppRouter.routers.routerDelegate,
                  routeInformationProvider: MyAppRouter.routers.routeInformationProvider,
                  supportedLocales: AppLocalizationsSetup.supportedLocales,
                  localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
                  localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
                  locale: localeState.locale,
                  // initialRoute: RouteName.splash,
                  // onGenerateRoute: Routes.generateRoute,
                ),
              );
            }
          )
        );
      },
    );
  }
}

class unknownView extends StatelessWidget {
  const unknownView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Localization"),
      ),
      body: Container(
        height: 20.h,
        color: Colors.indigo,
        width: 100.w,
        child: const Center(child: Text("Page doesn't found 404",
          style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 30),)),
      )
    );
  }
}

