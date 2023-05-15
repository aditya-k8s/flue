import 'package:allohuggy/Service_provider/Utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../Routes/routes.dart';
import '../bottom_bar.dart';

class BottomProfileClient extends StatefulWidget {
  const BottomProfileClient({Key? key}) : super(key: key);

  @override
  State<BottomProfileClient> createState() => _BottomProfileClientState();
}

class _BottomProfileClientState extends State<BottomProfileClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorX.scaffoldBackGroundX,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w600,color: ColorX.buttonColor)),

                                ],
                              ),
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
            Center(child: Text('User Name Here',style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600,color: ColorX.blackX))),
            Center(child: Text('username@domainname.com',style: GoogleFonts.quicksand(fontSize: 14,fontWeight: FontWeight.w500,color: ColorX.blackX))),
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
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('image/call.svg',color: ColorX.blackX,height: 16.5),
                          SizedBox(width: 3.w),
                          Text('+ 26589 562 989',style: GoogleFonts.quicksand(fontSize: 14,fontWeight: FontWeight.w600,color: ColorX.blackX))
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
                              SvgPicture.asset('image/creditcard.svg',color: ColorX.blackX,height: 16.5),
                              SizedBox(width: 2.w),
                              Text('Account Details',style:  GoogleFonts.quicksand(fontSize: 14,fontWeight: FontWeight.w600,color: ColorX.blackX))
                            ],
                          ),
                          GestureDetector(
                            onTap: (){
                              GoRouter.of(context).pushNamed(MyAppRouteConstants.bankDetailsClient);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: ColorX.textColor)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(Icons.arrow_forward_ios,size: 2.h,),
                                )),
                          )
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
                              SvgPicture.asset('image/details.svg',color: ColorX.blackX,height: 16.5),
                              SizedBox(width: 3.w),
                              Text('Service Details',style:  GoogleFonts.quicksand(fontSize: 14,fontWeight: FontWeight.w600,color: ColorX.blackX))
                            ],
                          ),
                          GestureDetector(
                            onTap: (){
                              GoRouter.of(context).pushNamed(MyAppRouteConstants.serviceHistoryClient);
                              // setState(() {
                              //   newIndex!-2;
                              // });


                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: ColorX.textColor)
                                ),
                                child:  Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(Icons.arrow_forward_ios,size: 2.h,),
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height:1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('image/clock.svg',color: ColorX.blackX,height: 16.5,width: 16.6,),
                              SizedBox(width: 2.w),
                              Text('Wallet History',style:  GoogleFonts.quicksand(fontSize: 14,fontWeight: FontWeight.w600,color: ColorX.blackX))
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
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('image/notificaton.svg',color: ColorX.blackX,height: 16.5,width: 16.6,),
                              SizedBox(width: 3.w),
                              Text('Notifications',style:  GoogleFonts.quicksand(fontSize: 14,fontWeight: FontWeight.w600,color: ColorX.blackX))
                            ],
                          ),
                          GestureDetector(
                            onTap: (){
                              GoRouter.of(context).pushNamed(MyAppRouteConstants.notificationScreen);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: ColorX.textColor)
                                ),
                                child:  Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(Icons.arrow_forward_ios,size: 2.h,),
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('image/logout.svg',color: ColorX.blackX,height: 16.5),
                          SizedBox(width: 3.w),
                          Text('Logout',style:  GoogleFonts.quicksand(fontSize: 14,fontWeight: FontWeight.w600,color: ColorX.blackX))
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        )
    );
  }
}
