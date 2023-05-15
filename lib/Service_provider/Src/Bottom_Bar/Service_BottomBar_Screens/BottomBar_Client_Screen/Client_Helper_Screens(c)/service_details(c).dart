import 'package:allohuggy/Service_provider/Utilities/colors.dart';
import 'package:allohuggy/Service_provider/Utilities/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../../../../Routes/routes.dart';

class ServiceDetailsClient extends StatefulWidget {
  const ServiceDetailsClient({Key? key}) : super(key: key);

  @override
  State<ServiceDetailsClient> createState() => _ServiceDetailsClientState();
}

class _ServiceDetailsClientState extends State<ServiceDetailsClient> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0XFFE3EFFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 23.h,
                width: 100.w,
                child: SvgPicture.asset(
                  'image/Vector (2).svg',
                  fit: BoxFit.cover,
                  width: 100.w,
                ),
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
                        Text('Service Details',
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
            padding: EdgeInsets.only(left: 3.w),
            child: Text(
              'Your History',
              style: TextStyle(
                  color: ColorX.blackX,
                  fontWeight: FontWeight.w600,
                  fontSize: 21.sp),
            ),
          ),
          SizedBox(
            height: 2.w,
          ),
          Padding(
            padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 2.h),
            child: Container(
              width: 100.w,
              decoration: BoxDecoration(
                  color: ColorX.whiteX,
                  borderRadius: BorderRadius.circular(4.w)),
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
                                Text('Status : Completed',
                                    style: TextStyle(
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
                                Text('Date : 23April,2023',
                                    style: TextStyle(
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
                                  child: Text('Time : 9:00AM TO 11:00AM',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
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
                                Text('Payment : \$75',
                                    style: TextStyle(
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
                    Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
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
                                    shape: BoxShape.circle, color: Colors.red),
                                child: Image.asset(
                                  'image/Rectangle 1933.png',
                                  fit: BoxFit.contain,
                                ),
                              );
                            }),
                          )
                        ]),
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
                          padding: EdgeInsets.only(left: 2.w),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: const Color(0XFF2DBB55))),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Container(
                                    height: 1.h,
                                    width: 2.w,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0XFF2DBB55)),
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
                          padding: EdgeInsets.only(left: 2.5.w, top: 0.9.h),
                          child: Column(
                            children: List.generate(3, (index) {
                              return Column(
                                children: [
                                  SizedBox(
                                      height: 2.h,
                                      child: const VerticalDivider(
                                        color: Colors.grey,
                                        thickness: 4,
                                      )),
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
                              padding: EdgeInsets.only(left: 0.w),
                              child: Image.asset(
                                'image/Location.png',
                                height: 4.h,
                              ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _asyncConfirmDialog(context);
                          },
                          child: Container(
                            width: 25.w,
                            decoration: BoxDecoration(
                              color: const Color(0xffF4F501),
                              borderRadius: BorderRadius.circular(8.w),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "image/delete2.svg",
                                    height: size.height * 0.025,
                                  ),
                                  SizedBox(width: size.width * 0.02),
                                  const Text("Cancel"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context)
                                .pushNamed(MyAppRouteConstants.bookBySchedule);
                          },
                          child: Container(
                            width: size.width * 0.35,
                            decoration: BoxDecoration(
                              color: const Color(0xffF4F501),
                              borderRadius: BorderRadius.circular(8.w),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "image/editinterface.svg",
                                    height: size.height * 0.025,
                                  ),
                                  SizedBox(width: size.width * 0.02),
                                  const Text("Reschedule"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: const Color(0xffF4F501),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              "image/call.svg",
                              height: size.height * 0.025,
                              color: const Color(0xff22477B),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: const Color(0xffF4F501),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              "image/message.svg",
                              height: size.height * 0.025,
                              color: const Color(0xff22477B),
                            ),
                          ),
                        ),
                      ],
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

  _asyncConfirmDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.w)),
          content: SizedBox(
            height: 35.h,
            width: 100.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    'image/Group 16401.png',
                    height: 15.h,
                  ),
                ),
                Text(
                  'Are you sure',
                  style: TextStyle(
                      color: const Color(0XFFE53535),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'Delete this Service',
                  style: TextStyle(
                      color: const Color(0XFFE53535),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 30.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorX.textColor),
                          borderRadius: BorderRadius.circular(8.w)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                            child: Text(
                              'Cancle',
                              style: TextStyle(
                                  color: ColorX.textColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        bottomSheetSearchBar();
                      },
                      child: Container(
                        width: 30.w,
                        decoration: BoxDecoration(
                            color: const Color(0XFFE53535),
                            borderRadius: BorderRadius.circular(8.w)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                              child: Text('Delete',
                                  style: TextStyle(
                                      color: ColorX.whiteX,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp))),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  bool? bottomIsChecked = false;
  bool? bottomIsChecked1 = false;
  bool? bottomIsChecked2 = false;
  bool? bottomIsChecked3 = false;
  bool? bottomIsChecked4 = false;
  bool? bottomIsChecked5 = false;
  bool? cancelReasonBool = false;
  int colorss = 0;





  bottomSheetSearchBar() async {
    showModalBottomSheet<Future>(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.w),
            topRight: Radius.circular(4.w),
          ),
        ),
        isScrollControlled: true,
        constraints: BoxConstraints.tight(Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * .6)),
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 1.h,
                    ),
                    Center(
                      child: Container(
                        height: 0.8.h,
                        width: 15.w,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(4.w)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("cancle");
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 3.w),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SvgPicture.asset('image/Shape1.svg'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Why do you want to cancel?',
                      style: TextStyle(
                          color: ColorX.blackX,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Expanded(
                        child: Padding(
                          padding:  EdgeInsets.only(left: 3.w,right: 3.w),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Incorrect Address',style: TextStyle(color: ColorX.blackX,fontWeight: FontWeight.w400,fontSize: 14.sp),),
                                  Transform.scale(
                                    scale: 2,
                                    child: Checkbox(
                                        value:bottomIsChecked,
                                        checkColor:Colors.white,
                                        activeColor:const Color(0xff008000),
                                        side: BorderSide(color: ColorX.textColor),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        onChanged: (value) {
                                          state(() {
                                            bottomIsChecked = value;
                                            // colorss = index;
                                          });
                                        }
                                    ),
                                  ),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: 80.w,
                                      child: Text('I’ve got no offer from Service Provider',textAlign: TextAlign.justify,style: TextStyle(color: ColorX.blackX,fontWeight: FontWeight.w400,fontSize: 14.sp),)),
                                  Transform.scale(
                                    scale: 2,
                                    child: Checkbox(
                                        value:bottomIsChecked1,
                                        checkColor:Colors.white,
                                        activeColor:const Color(0xff008000),
                                        side: BorderSide(color: ColorX.textColor),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        onChanged: (value) {
                                          state(() {
                                            bottomIsChecked1 = value;
                                            // colorss = index;
                                          });
                                        }
                                    ),
                                  ),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('To change the Address',style: TextStyle(color: ColorX.blackX,fontWeight: FontWeight.w400,fontSize: 14.sp),),
                                  Transform.scale(
                                    scale: 2,
                                    child: Checkbox(
                                        value:bottomIsChecked2,
                                        checkColor:Colors.white,
                                        activeColor:const Color(0xff008000),
                                        side: BorderSide(color: ColorX.textColor),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        onChanged: (value) {
                                          state(() {
                                            bottomIsChecked2 = value;

                                          });
                                        }
                                    ),
                                  ),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('I don’t want to service any more',style: TextStyle(color: ColorX.blackX,fontWeight: FontWeight.w400,fontSize: 14.sp),),
                                  Transform.scale(
                                    scale: 2,
                                    child: Checkbox(
                                        value:bottomIsChecked3,
                                        checkColor:Colors.white,
                                        activeColor:const Color(0xff008000),
                                        side: BorderSide(color: ColorX.textColor),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        onChanged: (value) {
                                          state(() {
                                            bottomIsChecked3 = value;
                                            // colorss = index;
                                          });
                                        }
                                    ),
                                  ),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('To change the Schedule',style: TextStyle(color: ColorX.blackX,fontWeight: FontWeight.w400,fontSize: 14.sp),),
                                  Transform.scale(
                                    scale: 2,
                                    child: Checkbox(
                                        value:bottomIsChecked4,
                                        checkColor:Colors.white,
                                        activeColor:const Color(0xff008000),
                                        side: BorderSide(color: ColorX.textColor),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        onChanged: (value) {
                                          state(() {
                                            bottomIsChecked4 = value;
                                            // colorss = index;
                                          });
                                        }
                                    ),
                                  ),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Another reason',style: TextStyle(color: ColorX.blackX,fontWeight: FontWeight.w400,fontSize: 14.sp),),
                                  Transform.scale(
                                    scale: 2,
                                    child: Checkbox(
                                        value:bottomIsChecked5,
                                        checkColor:Colors.white,
                                        activeColor:const Color(0xff008000),
                                        side: BorderSide(color: ColorX.textColor),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                        onChanged: (value) {
                                          state(() {
                                            bottomIsChecked5 = value;
                                            Navigator.of(context).pop();
                                            //cancelReasonBool = true;
                                            cancelReasons();

                                          });
                                        }
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pop();
                                },
                                child: Padding(
                                  padding:  EdgeInsets.only(left: 5.w,right: 5.w),
                                  child: CommonButton(
                                    height: 7.h,
                                    buttonText: 'Done',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ))

                  ],
                );
              });
        });
  }
  cancelReasons() async {
    showModalBottomSheet<Future>(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.w),
            topRight: Radius.circular(4.w),
          ),
        ),
        isScrollControlled: true,
        constraints: BoxConstraints.tight(Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * .4)),
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 1.h,
                    ),
                    Center(
                      child: Container(
                        height: 0.8.h,
                        width: 15.w,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(4.w)),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 2.w,right: 2.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          GestureDetector(
                            onTap: () {
                              print("back");
                              bottomSheetSearchBar();

                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 3.w),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorX.textColor
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Icon(Icons.arrow_back_ios,color: ColorX.whiteX,size: 2.h,),
                                    )),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print("cancle");
                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 3.w),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: SvgPicture.asset('image/Shape1.svg'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Give the reason for cancellation',
                      style: TextStyle(
                          color: ColorX.blackX,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 4.w,right: 4.w),
                      child: Container(
                        height: 15.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: ColorX.scaffoldBackGroundX,
                            borderRadius: BorderRadius.circular(2.w)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: const InputDecoration.collapsed(
                                hintText: 'Additional comments...'
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding:  EdgeInsets.only(left: 5.w,right: 5.w),
                        child: CommonButton(
                          height: 7.h,
                          buttonText: 'Done',
                        ),
                      ),
                    )

                  ],
                );
              });
        });
  }

}
