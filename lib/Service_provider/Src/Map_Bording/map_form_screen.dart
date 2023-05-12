import 'package:allohuggy/Service_provider/Routes/routes.dart';
import 'package:allohuggy/Service_provider/Utilities/common_button.dart';
import 'package:allohuggy/Service_provider/Utilities/shred_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../Utilities/colors.dart';

class MapFromScreen extends StatelessWidget {
  final String? houseNo;
  final String? street;

   MapFromScreen({Key? key,this.houseNo,this.street}) : super(key: key);


  final TextStyle _textStyle = GoogleFonts.poppins(
      color: ColorX.textColor, fontSize: 14, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body: ShredHelper.feedType == "USER"?

      SingleChildScrollView(
        child: Column(
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
                    top: 6.h,
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
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Inscription",
                              style: GoogleFonts.poppins(
                                  fontSize: 32,
                                  color: ColorX.whiteX,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Client",
                              style: GoogleFonts.quicksand(
                                  fontSize: 34,
                                  color: ColorX.whiteX,
                                  fontWeight: FontWeight.w500),
                            ),
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
                  padding: EdgeInsets.only(left: 3.w),
                  child: Text("House No. Building Name*", style: _textStyle),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: TextFormField(),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.w),
                  child: Text("Road Name, Area, Colony*", style: _textStyle),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: TextFormField(),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.w, right: 35.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Street*", style: _textStyle),
                      Text("City*", style: _textStyle)
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 40.w,
                          child: TextFormField()),
                      SizedBox(
                          width: 40.w,
                          child: TextFormField()),

                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.w, right: 35.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Pincode*", style: _textStyle),
                      Text("State*", style: _textStyle)
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 40.w,
                          child: TextFormField()),
                      SizedBox(
                          width: 40.w,
                          child: TextFormField()),

                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 6.w,right: 6.w),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    border: Border.all(color: ColorX.textColor,width: 2)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.navigation,color: ColorX.textColor,),
                      Text('USE CURRENT LOCATION',style: GoogleFonts.quicksand(color: ColorX.textColor,fontWeight: FontWeight.w700,fontSize: 13))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            InkWell(
              onTap: (){
                GoRouter.of(context).pushNamed(MyAppRouteConstants.paymentView);
              },
              child: Padding(
                padding:  EdgeInsets.only(left: 6.w,right: 6.w,bottom: 3.h),
                child: CommonButton(
                  height: 7.h,
                  buttonText: "SAVE LOCATION",
                ),
              ),
            )
          ],
        ),
      )
          :


      SingleChildScrollView(
        child: Column(
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
                    top: 6.h,
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

                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Registration",
                              style: GoogleFonts.poppins(
                                  fontSize: 32,
                                  color: ColorX.whiteX,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Artisan",
                              style: GoogleFonts.quicksand(
                                  fontSize: 34,
                                  color: ColorX.whiteX,
                                  fontWeight: FontWeight.w500),
                            ),
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
                  padding: EdgeInsets.only(left: 3.w),
                  child: Text("House No. Building Name*", style: _textStyle),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: TextFormField(),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.w),
                  child: Text("Road Name, Area, Colony*", style: _textStyle),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: TextFormField(),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.w, right: 35.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Street*", style: _textStyle),
                      Text("City*", style: _textStyle)
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       SizedBox(
                           width: 40.w,
                           child: TextFormField()),
                       SizedBox(
                           width: 40.w,
                           child: TextFormField()),

                     ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.w, right: 35.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Pincode*", style: _textStyle),
                      Text("State*", style: _textStyle)
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       SizedBox(
                           width: 40.w,
                           child: TextFormField()),
                       SizedBox(
                           width: 40.w,
                           child: TextFormField()),

                     ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 6.w,right: 6.w),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  border: Border.all(color: ColorX.textColor,width: 2)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.navigation,color: ColorX.textColor,),
                      Text('USE CURRENT LOCATION',style: GoogleFonts.quicksand(color: ColorX.textColor,fontWeight: FontWeight.w700,fontSize: 13))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            InkWell(
              onTap: (){
                GoRouter.of(context).pushNamed(MyAppRouteConstants.paymentView);
              },
              child: Padding(
                padding:  EdgeInsets.only(left: 6.w,right: 6.w,bottom: 3.h),
                child: CommonButton(
                  height: 7.h,
                  buttonText: "SAVE LOCATION",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


