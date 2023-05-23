import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../Resources/colors.dart';

class BottomService extends StatefulWidget {
  const BottomService({Key? key}) : super(key: key);

  @override
  State<BottomService> createState() => _BottomServiceState();
}

class _BottomServiceState extends State<BottomService> {
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
                  top: 5.h,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('Your Service',
                                    style: GoogleFonts.poppins(
                                        fontSize: 24,
                                        color: ColorX.whiteX,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 4.w),
                              child: Row(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: ColorX.whiteX, width: 2)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.notifications,
                                          color: ColorX.whiteX,
                                        ),
                                      ))
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 6.w,
              right: 4.w,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorX.whiteX,
                  border: Border.all(color: ColorX.underLineColor),
                  borderRadius: BorderRadius.circular(8.w)),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, top: 1, bottom: 0, right: 18),
                child: TextField(
                  textAlign: TextAlign.left,
                  autocorrect: false,
                  decoration:
                  //disable single line border below the text field
                  InputDecoration(
                      hintText: 'Search your service',
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 13,
                          color: ColorX.blackX,
                          fontWeight: FontWeight.w400),
                      labelStyle: GoogleFonts.poppins(
                          fontSize: 13,
                          color: ColorX.blackX,
                          fontWeight: FontWeight.w400),
                      border: InputBorder.none,
                      suffixIcon:
                      Icon(Icons.search, color: ColorX.underLineColor)),
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: ColorX.blackX,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          SizedBox(
            height: 51.h,
            width: 100.w,
            child:ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 10,
                itemBuilder: (context,index){
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5.w, right: 5.w),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: ColorX.whiteX,
                          borderRadius: BorderRadius.circular(2.w)),
                      child: Padding(
                        padding: EdgeInsets.all(1.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  child: Image.asset(
                                    'image/Rectangle 1876.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text('Air Condition',
                                    style: GoogleFonts.quicksand(
                                        fontSize: 15,
                                        color: ColorX.blackX,
                                        fontWeight: FontWeight.w500))
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _asyncConfirmDialog(context);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: ColorX.textColor)),
                                    child: Padding(
                                      padding: EdgeInsets.all(4.w),
                                      child: Image.asset('image/delete.png'),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  )
                ],
              );
            }) ,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 1.h, top: 1.h, right: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 60.w,
                  decoration: BoxDecoration(
                      color: ColorX.buttonColor,
                      borderRadius: BorderRadius.circular(8.w)),
                  child: Padding(
                    padding: EdgeInsets.all(5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorX.textColor
                            ),
                            child: Icon(Icons.add, color: ColorX.whiteX,size: 20,)),
                        SizedBox(width: 5,),
                        Text(
                          'ADD NEW SERVICE',
                          style: GoogleFonts.quicksand(
                              color: ColorX.textColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
              ],
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
                    height: 12.h,
                  ),
                ),
                Text(
                  'Are you sure',
                  style: GoogleFonts.quicksand(
                      color: const Color(0XFFE53535),
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'Delete this Service',
                  style: GoogleFonts.quicksand(
                      color: const Color(0XFFE53535),
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop(true);
                      },
                      child: Container(
                        width: 30.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorX.textColor),
                            borderRadius: BorderRadius.circular(8.w)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                              child: Text(
                                'Cancel',
                                style: GoogleFonts.quicksand(
                                    color: ColorX.textColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Container(
                        width: 30.w,
                        decoration: BoxDecoration(
                            color: Color(0XFFE53535),
                            borderRadius: BorderRadius.circular(8.w)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                              child: Text('Delete',
                                  style: GoogleFonts.quicksand(
                                      color: ColorX.whiteX,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18))),
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
}
