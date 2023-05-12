import 'package:allohuggy/Service_provider/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../Utilities/colors.dart';


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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          child: SvgPicture.asset(
                            "image/app_logo.svg",
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
                    height: 7.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        border:state.selectColor!?Border.all(color: ColorX.buttonColor): Border.all(color: Color(0xFF22477B)),
                        borderRadius: BorderRadius.circular(8.w),
                        color: state.selectColor!
                            ? ColorX.buttonColor
                            : Color(0xFFE3EFFF)),
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
                    height: 7.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        border: state.selectColor!? Border.all(color: Color(0xFF22477B)):Border.all(color: ColorX.buttonColor),
                        borderRadius: BorderRadius.circular(8.w),
                        color: state.selectColor!
                            ? Color(0xFFE3EFFF)
                            : ColorX.buttonColor),
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
              Padding(
                padding:  EdgeInsets.only(bottom: 10.h),
                child: SvgPicture.asset(
                  "image/Group 16400.svg",
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