import 'package:allohuggy/Service_provider/Utilities/colors.dart';
import 'package:allohuggy/Service_provider/Utilities/common_button.dart';
import 'package:allohuggy/Service_provider/Utilities/shred_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../Routes/routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body: SingleChildScrollView(
        child: ShredHelper.feedType=='USER'?Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    top: 4.h,
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop(true);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                size: 25.sp,
                                color: ColorX.whiteX,
                              )),
                          SizedBox(height: 0.5.h,),
                          Text(
                            "Login",
                            style: GoogleFonts.poppins(
                                fontSize: 32,
                                color: ColorX.whiteX,
                                fontWeight: FontWeight.w600),
                          ),
                          Text('Lorem Ipsum is simply dummy text \nof the printing and typesetting industry.',textAlign: TextAlign.justify,style: GoogleFonts.quicksand(
                              fontSize: 16,
                              color: ColorX.whiteX,
                              fontWeight: FontWeight.w500),)
                        ],
                      ),
                    )),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: Text("Email or Phone Number", style: _textStyle),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: TextFormField(),
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: Text("Password", style: _textStyle),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: TextFormField(
                    obscureText: true,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 6.w, right: 6.w),
              child: CommonButton(
                height: 7.h,
                buttonText: 'LOGIN',
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Center(
                child: Text(
                  'Or Login with',
                  style: _textStyle,
                )),
            SizedBox(
              height: 4.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 5.h,
                    width: 14.w,
                    decoration: BoxDecoration(
                        color: ColorX.whiteX,
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorX.blackX)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('image/facebook.svg'),
                    ),
                  ),
                  Container(
                    height: 5.h,
                    width: 14.w,
                    decoration: BoxDecoration(
                        color: ColorX.whiteX,
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorX.blackX)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('image/Group 16171.svg'),
                    ),
                  ),
                  Container(
                    height: 5.h,
                    width: 14.w,
                    decoration: BoxDecoration(
                        color: ColorX.whiteX,
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorX.blackX)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('image/Logo.svg'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Center(
              child: Text(
                'Don’t have an account?',
                style: _textStyle,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
          ],
        ): Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    top: 4.h,
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop(true);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                size: 25.sp,
                                color: ColorX.whiteX,
                              )),

                          SizedBox(height: 0.5.h,),

                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(
                              "Login",
                              style: GoogleFonts.poppins(
                                  fontSize: 32,
                                  color: ColorX.whiteX,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text('Lorem Ipsum is simply dummy text \nof the printing and typesetting industry.',textAlign: TextAlign.justify,style: GoogleFonts.quicksand(
                                fontSize: 16,
                                color: ColorX.whiteX,
                                fontWeight: FontWeight.w500),),
                          )

                        ],
                      ),
                    )),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: Text("Email or Phone Number", style: _textStyle),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: TextFormField(),
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: Text("Password", style: _textStyle),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: TextFormField(
                    obscureText: true,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            GestureDetector(
              onTap: (){
                GoRouter.of(context).pushNamed(MyAppRouteConstants.bottomBar);
              },
              child: Padding(
                padding: EdgeInsets.only(left: 6.w, right: 6.w),
                child: CommonButton(
                  height: 7.h,
                  buttonText: 'LOGIN',
                ),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Center(
                child: Text(
              'Or Login with',
              style: _textStyle,
            )),
            SizedBox(
              height: 4.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 5.h,
                    width: 14.w,
                    decoration: BoxDecoration(
                        color: ColorX.whiteX,
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorX.blackX)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('image/facebook.svg'),
                    ),
                  ),
                  Container(
                    height: 5.h,
                    width: 14.w,
                    decoration: BoxDecoration(
                        color: ColorX.whiteX,
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorX.blackX)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('image/Group 16171.svg'),
                    ),
                  ),
                  Container(
                    height: 5.h,
                    width: 14.w,
                    decoration: BoxDecoration(
                        color: ColorX.whiteX,
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorX.blackX)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('image/Logo.svg'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Don’t have an account?',
                  style: _textStyle,
                ),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
          ],
        ),
      ),
    );
  }

  final TextStyle _textStyle = GoogleFonts.poppins(
      color: ColorX.textColor, fontSize: 14, fontWeight: FontWeight.w400);
}
