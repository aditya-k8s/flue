import 'package:allohuggy/Service_provider/Routes/routes.dart';
import 'package:allohuggy/Service_provider/Utilities/colors.dart';
import 'package:allohuggy/Service_provider/Utilities/common_button.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class BookBySchedule extends StatefulWidget {
  const BookBySchedule({Key? key}) : super(key: key);

  @override
  State<BookBySchedule> createState() => _BookByScheduleState();
}

class _BookByScheduleState extends State<BookBySchedule> {

  DateTime now = DateTime.now();
  final moonLanding = DateTime.parse('1969-07-20 20:18:04Z');

  @override
  void initState(){

    print("new time ${moonLanding.hour}");
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body: Column(
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
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            children: [
                              Icon(Icons.arrow_back,
                                  color: ColorX.whiteX, size: 3.h),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text('Service Request',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: ColorX.buttonColor,
                                fontWeight: FontWeight.w800)),
                      ],
                    ),
                  )),
            ],
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 4.w, right: 4.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Type of Service",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            child: Image.asset(
                              'image/Rectangle 1876.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Plumbing',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 17),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: ColorX.scaffoldBackGroundX,
                            child: Image.asset('image/Rectangle 1876.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 3.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Charles J. Smith",
                                      style: TextStyle(
                                          color: ColorX.blackX,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      '( Plumber )',
                                      style: TextStyle(
                                          color: ColorX.blackX,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star_border_outlined,
                                        color: ColorX.textColor),
                                    Text('4.6 (313 Review)',
                                        style: TextStyle(
                                            color: ColorX.blackX,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w600))
                                  ],
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const Text(
                    "Select Date",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                     height: 1.h,
                   ),
                  Container(
                     decoration: BoxDecoration(
                       color: ColorX.whiteX,
                       borderRadius: BorderRadius.circular(5.w)
                     ),
                     child: CalendarDatePicker2(
                      config: CalendarDatePicker2Config(
                        controlsHeight: 6.h,
                        controlsTextStyle: TextStyle(color: ColorX.blackX,fontWeight: FontWeight.bold,fontSize: 10.sp),
                        nextMonthIcon: Icon(Icons.arrow_forward_ios,color: ColorX.blackX,),
                        lastMonthIcon: Icon(Icons.arrow_back_ios,color: ColorX.blackX,),
                         dayBorderRadius: BorderRadius.circular(3.w),
                        weekdayLabelTextStyle:TextStyle(color: ColorX.blackX,fontWeight: FontWeight.bold,fontSize: 10.sp) ,
                        dayTextStyle: TextStyle(color: ColorX.blackX,fontWeight: FontWeight.bold,fontSize: 10.sp),
                        dayBuilder: ({
                          required date,
                          textStyle,
                          decoration,
                          isSelected,
                          isDisabled,
                          isToday,
                        }) {
                          Widget? dayWidget;
                          if (date.day % 1 == 0 ) {
                            dayWidget = Container(
                              decoration: decoration,
                              child: Stack(
                                children: [
                                  Container(
                                    height: 5.h,
                                    width: 12.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.w),
                                      color: isSelected == false? ColorX.scaffoldBackGroundX.withOpacity(0.5):ColorX.underLineColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        MaterialLocalizations.of(context).formatDecimal(date.day),
                                        style: textStyle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          return dayWidget;
                        },
                        yearBuilder: ({
                          required year,
                          decoration,
                          isCurrentYear,
                          isDisabled,
                          isSelected,
                          textStyle,
                        }) {
                          return Center(
                            child: Container(
                              decoration: decoration,
                              height: 36,
                              width: 72,
                              child: Center(
                                child: Semantics(
                                  selected: isSelected,
                                  button: true,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        year.toString(),
                                        style: textStyle,
                                      ),
                                      if (isCurrentYear == true)
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          margin: const EdgeInsets.only(left: 5),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        calendarType: CalendarDatePicker2Type.single),
                        value: [],
                        onValueChanged: (val){
                        print('date is $val');
                        },
                     ),
                   ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const Text(
                    "Select Time",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: ColorX.whiteX,
                      borderRadius: BorderRadius.circular(4.w)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                         print('time forward');
                                     //DateTime(now.hour+1);
                                     // var time=DateFormat('HH').format(now);
                                     // print(time);
                                       DateTime(now.hour+1);
                                       DateFormat.H().format(now);
                                      // print(time);
                                      });
                                    },
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: ColorX.scaffoldBackGroundX,
                                      child: Icon(Icons.keyboard_arrow_up,color: ColorX.blackX,),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(now.hour.toString(),style: TextStyle(color: ColorX.blackX,fontWeight: FontWeight.bold,fontSize: 10.sp)),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: ColorX.scaffoldBackGroundX,
                                    child: Icon(Icons.keyboard_arrow_down,color: ColorX.blackX,),
                                  )
                                ],
                              ),
                              Padding(
                                padding:  EdgeInsets.only(top: 5.5.h),
                                child: Text(':',style: TextStyle(color: ColorX.blackX,fontWeight: FontWeight.bold,fontSize: 10.sp),),
                              ),
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: ColorX.scaffoldBackGroundX,
                                    child: Icon(Icons.keyboard_arrow_up,color: ColorX.blackX,),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(DateFormat("mm").format(DateTime.now()),style: TextStyle(color: ColorX.blackX,fontWeight: FontWeight.bold,fontSize: 10.sp),),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: ColorX.scaffoldBackGroundX,
                                    child: Icon(Icons.keyboard_arrow_down,color: ColorX.blackX,),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: ColorX.scaffoldBackGroundX,
                                    child: Icon(Icons.keyboard_arrow_up,color: ColorX.blackX,),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                   Text('AM',style: TextStyle(color: ColorX.blackX,fontWeight: FontWeight.bold,fontSize: 10.sp),),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: ColorX.scaffoldBackGroundX,
                                    child: Icon(Icons.keyboard_arrow_down,color: ColorX.blackX,),
                                  )
                                ],
                              ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: (){
                      print('object');
                      GoRouter.of(context).pushNamed(MyAppRouteConstants.bankDetailsClient);
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(left: 4.w,right: 4.w),
                      child: CommonButton(
                        height: 7.h,
                        buttonText: 'Confirm & Pay',
                      ),
                    ),
                  )

                ],
              ),
            ),
          )),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}
