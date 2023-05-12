import 'package:allohuggy/Service_provider/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../Utilities/colors.dart';
import '../../Utilities/shred_helper.dart';
import 'language_type_scren.dart';

class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnotherBoolCubit, AnotherBoolState>(
      builder: (context, state) {
        final AnotherBoolCubit cubit =
            BlocProvider.of<AnotherBoolCubit>(context);
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
                "You Are",
                style: TextStyleX.textStyles,
              ),
              GestureDetector(
                onTap: () async {
                  cubit.onBool(true);
                  ShredHelper.feedType = "USER";
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.setString('feedType', 'USER');
                  GoRouter.of(context).pushNamed(MyAppRouteConstants.registerForm);
                  print("client ${ShredHelper.feedType}");
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 4.w, right: 4.w),
                  child: Container(
                    height: 7.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        border: state.anotherBool!
                            ? Border.all(color: ColorX.buttonColor)
                            : Border.all(color: Color(0xFF22477B)),
                        borderRadius: BorderRadius.circular(8.w),
                        color: state.anotherBool!
                            ? ColorX.buttonColor
                            : Color(0xFFE3EFFF)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        "CLIENT",
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
                  ShredHelper.feedType = "SERVICE";
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('feedType', 'SERVICE');
                  GoRouter.of(context).pushNamed(MyAppRouteConstants.registerCategoryScreen);
                  print("Artisan");
                  print('feed type is ${ShredHelper.feedType}');
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 4.w, right: 4.w),
                  child: Container(
                    height: 7.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        border: state.anotherBool!
                            ? Border.all(color: Color(0xFF22477B))
                            : Border.all(color: ColorX.buttonColor),
                        borderRadius: BorderRadius.circular(8.w),
                        color: state.anotherBool!
                            ? Color(0xFFE3EFFF)
                            : ColorX.buttonColor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        "ARTISAN",
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

class AnotherBoolState {
  bool? anotherBool = false;
  AnotherBoolState({this.anotherBool});
}

class AnotherBoolCubit extends Cubit<AnotherBoolState> {
  AnotherBoolCubit() : super(AnotherBoolState(anotherBool: false));
  void onBool(bool selectColor) =>
      emit(AnotherBoolState(anotherBool: selectColor));
}
