import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../Resources/colors.dart';
import '../../Utilities/Routes/routes.dart';


class LanguageTypeScreen extends StatelessWidget {
  LanguageTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeBoolCubit, ChangeBoolState>(
      builder: (context, state) {
        final ChangeBoolCubit cubit = BlocProvider.of<ChangeBoolCubit>(context);
        return Scaffold(
          backgroundColor: ColorX.scaffoldBackGroundX,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  SvgPicture.asset(
                    'image/Vector (1).svg',
                    fit: BoxFit.fitWidth,
                    width: 100.w,
                  ),
                  Positioned(
                    top: 0.h,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.w, top: 1.h),
                      child: SizedBox(
                        height: 25.h,
                        width: 40.w,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "image/app_logo.png",
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                "Choose Your Language",
                style: TextStyleX.textStyles,
              ),
              SizedBox(height: 4.h,),
              GestureDetector(
                onTap: () async{
                  cubit.onBool(true);
                  print("Eng");
                  // BlocProvider.of<LocalCubit>(context).toEnglish();
                  // ShredHelper.languageType = "en";
                   SharedPreferences prefs = await SharedPreferences.getInstance();
                  // prefs.setString('languageType', "en");
                  GoRouter.of(context).pushNamed(MyAppRouteConstants.userTypeScreen);
                },
                child: Padding(
                  padding:  EdgeInsets.only(left: 4.w,right: 4.w),
                  child: Container(
                    height: 6.h,
                    width: 85.w,
                    decoration: BoxDecoration(
                        border:state.selectColor!?Border.all(color: ColorX.buttonColor): Border.all(color: Color(0xFF22477B)),
                        borderRadius: BorderRadius.circular(8.w),
                        color: state.selectColor!
                            ? ColorX.buttonColor
                            : Color(0xFFE3EFFF),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 3,
                          blurRadius: 4,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        "ENGLISH",
                            style: GoogleFonts.quicksand(
                                color: ColorX.textColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
              GestureDetector(
                onTap: () async {
                  cubit.onBool(false);
                  print("FRENCH");
                  // BlocProvider.of<LocalCubit>(context).toFrench();
                  // ShredHelper.languageType = "fr";
                  // SharedPreferences prefs = await SharedPreferences.getInstance();
                  // prefs.setString('languageType', "fr");
                GoRouter.of(context).pushNamed(MyAppRouteConstants.userTypeScreen);
                },
                child: Padding(
                  padding:  EdgeInsets.only(left: 4.w,right: 4.w),
                  child: Container(
                    height: 6.h,
                    width: 85.w,
                    decoration: BoxDecoration(
                        border: state.selectColor!? Border.all(color: Color(0xFF22477B)):Border.all(color: ColorX.buttonColor),
                        borderRadius: BorderRadius.circular(8.w),
                        color: state.selectColor!
                            ? Color(0xFFE3EFFF)
                            : ColorX.buttonColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 3,
                          blurRadius: 4,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        "FRENCH",
                        style: GoogleFonts.quicksand(
                            color: ColorX.textColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h,),
              Padding(
                padding:  EdgeInsets.only(bottom: 10.h),
                child: SvgPicture.asset(
                  "image/Group 16400.svg", height: 18.h,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class TextStyleX {
  static TextStyle textStyles = GoogleFonts.poppins(
      color: ColorX.textColor, fontWeight: FontWeight.w700, fontSize: 16.sp);
}

class ChangeBoolState {
  bool? selectColor = false;
  ChangeBoolState({this.selectColor});
}

class ChangeBoolCubit extends Cubit<ChangeBoolState> {
  ChangeBoolCubit() : super(ChangeBoolState(selectColor: false));

  void onBool(bool selectColor) =>
      emit(ChangeBoolState(selectColor: selectColor));
}
