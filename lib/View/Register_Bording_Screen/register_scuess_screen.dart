import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../Resources/colors.dart';
import '../../Resources/Component/common_button.dart';
import '../../Utilities/Routes/routes.dart';
import '../../View_Model_Data/user_prefences.dart';


class RegisterCompleteScreen extends StatelessWidget {
  const RegisterCompleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SvgPicture.asset(
                'image/Vector (1).svg',
                fit: BoxFit.fitWidth,
                width: 100.w,
              ),
              Positioned(
                  top: 6.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {
                              // Navigator.of(context).pop(true);
                              Navigator.of(context).pop(MyAppRouteConstants.registerCompleteScreen);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 25.sp,
                              color: ColorX.whiteX,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            UserPrefences.feedType == "USER"?"Inscription":"Registration",
                            style: GoogleFonts.poppins(
                                fontSize: 32,
                                color: ColorX.whiteX,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            UserPrefences.feedType == "USER"?"Client":"Artisan",
                            style: GoogleFonts.quicksand(
                                fontSize: 34,
                                color: ColorX.buttonColor,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),

          Center(child: SvgPicture.asset('image/user.svg')),
          SizedBox(
            height: 2.h,
          ),
          Center(child: Text("Account Activated",style: GoogleFonts.poppins(color: ColorX.textColor,fontSize: 28,fontWeight: FontWeight.w600),)),
          SizedBox(
            height: 6.h,
          ),
          GestureDetector(
            onTap: (){
              GoRouter.of(context).pushNamed(MyAppRouteConstants.mapScreen);
            },
            child: Padding(
              padding:  EdgeInsets.only(left: 8.w,right: 8.w),
              child: CommonButton(
                height: 6.h,
                buttonText: "FOLLOWING",
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 20.h),
            child: Center(child: Text('Feedback',style: GoogleFonts.quicksand(color: ColorX.textNew,fontSize: 16,fontWeight: FontWeight.w700,decoration: TextDecoration.underline))),
          )
        ],
      )
    );
  }
}
