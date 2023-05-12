import 'package:allohuggy/Service_provider/Utilities/colors.dart';
import 'package:allohuggy/Service_provider/Utilities/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class ServiceHistoryDetailClient extends StatefulWidget {
  const ServiceHistoryDetailClient({Key? key}) : super(key: key);

  @override
  State<ServiceHistoryDetailClient> createState() => _ServiceHistoryDetailClientState();
}

class _ServiceHistoryDetailClientState extends State<ServiceHistoryDetailClient> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  top: 5.h,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 4.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Icon(Icons.arrow_back,
                                    color: ColorX.whiteX, size: 3.h),
                              ),
                              Container(
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
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text('Service History',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: ColorX.buttonColor,
                                fontWeight: FontWeight.w800)),
                      ],
                    ),
                  )),
            ],
          ),
          Padding(
            padding:  EdgeInsets.only(left: 3.w),
            child: Text('Your History',style: TextStyle(color: ColorX.blackX,fontWeight: FontWeight.w600,fontSize: 21.sp),),
          ),
          SizedBox(
            height: 2.w,
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.w,right: 4.w,bottom: 2.h),
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
                        const CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.indigo,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text('Sophie R. Stevens',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: ColorX.blackX,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('image/tickmark.svg'),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text('Status : Completed', style: TextStyle(
                                    fontSize: 11.sp,
                                    color: ColorX.blackX,
                                    fontWeight: FontWeight.w400))
                              ],
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('image/creditcard.svg'),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text('Date : 23April,2023', style: TextStyle(
                                    fontSize: 11.sp,
                                    color: ColorX.blackX,
                                    fontWeight: FontWeight.w400))
                              ],
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('image/clock.svg'),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Container(
                                  child: Text('Time : 9:00AM TO 11:00AM', textAlign: TextAlign.justify,style: TextStyle(
                                      fontSize: 11.sp,
                                      color: ColorX.blackX,
                                      fontWeight: FontWeight.w400)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('image/paymenticon.svg'),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text('Payment : \$75', style: TextStyle(
                                    fontSize: 11.sp,
                                    color: ColorX.blackX,
                                    fontWeight: FontWeight.w400))
                              ],
                            ),
                          ],
                        )

                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    const Divider(thickness: 2),
                    Text('Service Request : Cleaning & Plumbing',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: ColorX.blackX,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 1.w,
                    ),
                    Text('Description :',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: ColorX.blackX,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 1.w,
                    ),
                    Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: ColorX.blackX,
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 1.w,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: List.generate(4, (index) {
                              return Container(
                                height: 8.h,
                                width: 20.w,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red
                                ),
                                child: Image.asset('image/Rectangle 1933.png',fit: BoxFit.contain,),
                              );
                            }),
                          )
                        ]
                    ),
                    SizedBox(
                      height: 1.w,
                    ),
                    Text('Address :',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: ColorX.blackX,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 1.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 2.w),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: const Color(0XFF2DBB55))
                                ),
                                child:  Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Container(
                                    height: 1.h,
                                    width: 2.w,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0XFF2DBB55)
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text('7958 Swift Village',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: ColorX.blackX,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 2.5.w,top: 0.9.h),
                          child: Column(
                            children: List.generate(3, (index) {
                              return Column(
                                children: [
                                  SizedBox(height: 2.h, child: const VerticalDivider(color: Colors.grey,thickness: 4,)),
                                  SizedBox(
                                    height: 0.5.h,
                                  )
                                ],
                              );

                            }),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(left: 0.w),
                              child: Image.asset('image/Location.png',height: 4.h,),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text('105 William St, Chicago, US',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: ColorX.blackX,
                                    fontWeight: FontWeight.w600))
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                     padding:  EdgeInsets.only(left: 4.w,right: 4.w),
                     child: CommonButton(
                       height: 7.h,
                       buttonText: 'Send Feedback',
                     ),
                   )
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
