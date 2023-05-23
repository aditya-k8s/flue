import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../Resources/colors.dart';
import '../../Utilities/Routes/routes.dart';
import '../../View_Model_Data/user_prefences.dart';


class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body: UserPrefences.feedType=='USER'?Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SvgPicture.asset(
                'image/Vector (2).svg',
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
                        SizedBox(height: 5,),
                        Text(
                          "Support",
                          style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w600,color: ColorX.buttonColor),
                        )
                      ],
                    ),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorX.whiteX,
                  borderRadius: BorderRadius.circular(3.w)
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: ColorX.textColor)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset('image/message1.svg',height: 3.h,),
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text('Chat with our Executive',style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w600,color: ColorX.blackX)),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        GoRouter.of(context).pushNamed(MyAppRouteConstants.chatScreen);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: ColorX.textColor)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(Icons.arrow_forward_ios,size: 2.h,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorX.whiteX,
                  borderRadius: BorderRadius.circular(3.w)
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: ColorX.textColor)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset('image/chatgpt.svg',height: 3.h,),
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Text('FAQ’s',style:  GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w600,color: ColorX.blackX)),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        print('faq');
                        GoRouter.of(context).pushNamed(MyAppRouteConstants.faqScreen);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: ColorX.textColor)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(Icons.arrow_forward_ios,size: 2.h,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorX.whiteX,
                  borderRadius: BorderRadius.circular(3.w)
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: ColorX.textColor)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset('image/call2.svg',height: 3.h,),
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Text('Call with our Executive',style:  GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w600,color: ColorX.blackX)),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: ColorX.textColor)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(Icons.arrow_forward_ios,size: 2.h,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorX.whiteX,
                  borderRadius: BorderRadius.circular(3.w)
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: ColorX.textColor)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset('image/chatgpt2.svg',height: 3.h,),
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Text('Access Chatgpt',style:  GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w600,color: ColorX.blackX)),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        print('chatgpt');
                        GoRouter.of(context).pushNamed(MyAppRouteConstants.chatGptScreen);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: ColorX.textColor)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(Icons.arrow_forward_ios,size: 2.h,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ):Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SvgPicture.asset(
                'image/Vector (2).svg',
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
                        SizedBox(height: 5,),
                        Text(
                          "Support",
                          style: TextStyle(
                              fontSize: 25.sp,
                              color: ColorX.whiteX,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorX.whiteX,
                  borderRadius: BorderRadius.circular(3.w)
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: ColorX.textColor)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset('image/message1.svg',height: 3.h,),
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text('Chat with our Executive',style: TextStyle(color: ColorX.blackX,fontWeight: FontWeight.w600,fontSize: 15.sp),),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        GoRouter.of(context).pushNamed(MyAppRouteConstants.chatScreen);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: ColorX.textColor)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(Icons.arrow_forward_ios,size: 2.h,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorX.whiteX,
                  borderRadius: BorderRadius.circular(3.w)
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: ColorX.textColor)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset('image/chatgpt.svg',height: 3.h,),
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Text('FAQ’s',style: TextStyle(color: ColorX.blackX,fontWeight: FontWeight.w600,fontSize: 15.sp),),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        print('faq');
                        GoRouter.of(context).pushNamed(MyAppRouteConstants.faqScreen);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: ColorX.textColor)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(Icons.arrow_forward_ios,size: 2.h,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorX.whiteX,
                  borderRadius: BorderRadius.circular(3.w)
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: ColorX.textColor)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset('image/call2.svg',height: 3.h,),
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Text('Call with our Executive',style: TextStyle(color: ColorX.blackX,fontWeight: FontWeight.w600,fontSize: 15.sp),),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: ColorX.textColor)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(Icons.arrow_forward_ios,size: 2.h,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorX.whiteX,
                  borderRadius: BorderRadius.circular(3.w)
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: ColorX.textColor)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset('image/chatgpt2.svg',height: 3.h,),
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Text('Access Chatgpt',style: TextStyle(color: ColorX.blackX,fontWeight: FontWeight.w600,fontSize: 15.sp),),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        print('chatgpt');
                        GoRouter.of(context).pushNamed(MyAppRouteConstants.chatGptScreen);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: ColorX.textColor)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(Icons.arrow_forward_ios,size: 2.h,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
