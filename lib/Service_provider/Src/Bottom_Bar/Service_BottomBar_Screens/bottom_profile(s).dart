import 'package:allohuggy/Service_provider/Routes/routes.dart';
import 'package:allohuggy/Service_provider/Utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class BottomProfile extends StatefulWidget {
  const BottomProfile({Key? key}) : super(key: key);

  @override
  State<BottomProfile> createState() => _BottomProfileState();
}

class _BottomProfileState extends State<BottomProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SvgPicture.asset(
                'image/Vector (2).svg',
                fit: BoxFit.fill,
                width: 100.w,
              ),
              Positioned(
                  top: 6.h,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w, right: 5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Profile',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: ColorX.whiteX,
                                        fontWeight: FontWeight.w600)),

                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    GoRouter.of(context).pushNamed(MyAppRouteConstants.editProfile);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: ColorX.whiteX, width: 2)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.edit_outlined,
                                          color: ColorX.whiteX,
                                        ),
                                      )),
                                ),
                                SizedBox(width: 2.w),
                                GestureDetector(
                                  onTap: (){
                                    print('support');
                                    GoRouter.of(context).pushNamed(MyAppRouteConstants.supportScreen);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: ColorX.whiteX, width: 2)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgPicture.asset('image/edit chat.svg'),
                                      )),
                                ),
                                SizedBox(width: 2.w),
                                GestureDetector(
                                  onTap: (){
                                    print('notification');
                                    GoRouter.of(context).pushNamed(MyAppRouteConstants.notificationScreen);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: ColorX.whiteX, width: 2)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.notification_important,
                                          color: ColorX.whiteX,
                                        ),
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),

                      ],
                    ),
                  )),
            ],
          ),
          SizedBox(
           height: 26.h,
           width: 100.w,
           child:  Stack(
             children: [
               SizedBox(
                 height: 20.h,
                 width: 100.w,
                 child: ClipRRect(
                     borderRadius: BorderRadius.only(
                       topLeft: Radius.circular(10.w),
                       bottomRight: Radius.circular(10.w),
                     ),
                   child: Image.asset('image/Rectangle 1959.png'),
                 ),
               ),
               Positioned(
                   top:11.h,
                   left: 30.w,
                   child: Container(
                     height: 15.h,
                     width: 40.w,
                     decoration:  BoxDecoration(
                       shape: BoxShape.circle,
                       color: Colors.purple.shade300
                     ),
                     child: Image.asset('image/Rectangle 1876.png',),
                   ),)
             ],
           ),
         ),
          Center(child: Text('User Name Here',style: TextStyle(color: ColorX.blackX,fontSize: 18.sp,fontWeight: FontWeight.w800),)),
          Center(child: Text('username@domainname.com',style: TextStyle(color: ColorX.blackX,fontSize: 14.sp,fontWeight: FontWeight.w500),)),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding:  EdgeInsets.only(left: 4.w,right: 4.w,),
            child: Container(
              width: 100.w,
              decoration: BoxDecoration(
                color: ColorX.whiteX,
                borderRadius: BorderRadius.circular(4.w)
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('image/call.svg',color: ColorX.blackX,height: 3.h),
                        SizedBox(width: 3.w),
                        Text('+ 26589 562 989',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.sp,color: ColorX.blackX),)
                      ],
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('image/creditcard.svg',color: ColorX.blackX,height: 3.h),
                            SizedBox(width: 2.w),
                            Text('Account Details',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.sp,color: ColorX.blackX),)
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
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('image/details.svg',color: ColorX.blackX,height: 3.h),
                            SizedBox(width: 3.w),
                            Text('Service Details',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.sp,color: ColorX.blackX),)
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: ColorX.textColor)
                            ),
                            child:  Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(Icons.arrow_forward_ios,size: 2.h,),
                            ))
                      ],
                    ),
                    SizedBox(
                      height:0.5.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('image/clock.svg',color: ColorX.blackX,height: 3.h),
                        SizedBox(width: 2.w),
                        Text('Wallet History',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.sp,color: ColorX.blackX),)
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('image/notificaton.svg',color: ColorX.blackX,height: 3.h),
                        SizedBox(width: 3.w),
                        Text('Notifications',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.sp,color: ColorX.blackX),)
                      ],
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('image/logout.svg',color: ColorX.blackX,height: 3.h),
                        SizedBox(width: 3.w),
                        Text('Logout',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.sp,color: ColorX.blackX),)
                      ],
                    ),


                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
