import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../Resources/colors.dart';
import '../../../../Utilities/Routes/routes.dart';

class BottomServiceClient extends StatefulWidget {
  const BottomServiceClient({Key? key}) : super(key: key);

  @override
  State<BottomServiceClient> createState() => _BottomServiceClientState();
}

class _BottomServiceClientState extends State<BottomServiceClient> {
  String dropdownvalue = 'In Progress';
  var items = [
    'In Progress',
    'Ashutosh',
    'Samriti',
    'Swastika',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body: Column(
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
                              Text('Your Services',
                                  style: GoogleFonts.poppins(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: ColorX.buttonColor)),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      GoRouter.of(context).pushNamed(
                                          MyAppRouteConstants.supportScreen);
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: ColorX.whiteX,
                                                width: 2)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: SvgPicture.asset(
                                            'image/edit chat.svg',
                                            color: Colors.white,
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      GoRouter.of(context).pushNamed(
                                          MyAppRouteConstants
                                              .notificationScreen);
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: ColorX.whiteX,
                                                width: 2)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.notification_important,
                                            color: ColorX.whiteX,
                                          ),
                                        )),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Upcoming Services",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorX.blackX)),
                DropdownButton(
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  elevation: 0,
                  underline: Container(),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: GoogleFonts.quicksand(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: ColorX.blackX),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 58.h,
            width: 100.w,
            child: ListView.builder(
                itemCount: 5,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pushNamed(
                          MyAppRouteConstants.serviceDetailsClient);
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(left: 3.w,right: 3.w,bottom: 1.h,top: 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorX.whiteX,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: size.width * 0.2,
                                  decoration: const BoxDecoration(
                                      color: Color(0xff22477B),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft:
                                        Radius.circular(20),
                                        bottomRight:
                                        Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      )),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        const CircleAvatar(
                                          radius: 3,
                                          backgroundColor:
                                          Colors.yellow,
                                        ),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        Text("in-progress",
                                            style:
                                            GoogleFonts.quicksand(
                                                fontSize: 10,
                                                fontWeight:
                                                FontWeight
                                                    .w600,
                                                color: ColorX
                                                    .whiteX))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 2.w),
                              child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  const CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                        "image/Rectangle 1933.png"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text("Sophie R. Stevens",
                                            style:
                                            GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight
                                                    .w600,
                                                color: ColorX
                                                    .blackX)),
                                        Text("(Plumber/Cleaner)",
                                            style:
                                            GoogleFonts.quicksand(
                                                fontSize: 12,
                                                fontWeight:
                                                FontWeight
                                                    .w600,
                                                color: ColorX
                                                    .blackX)),
                                        SizedBox(
                                            width: 65.w,
                                            child: Text(
                                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                                                textAlign:
                                                TextAlign.justify,
                                                style: GoogleFonts
                                                    .quicksand(
                                                    fontSize: 12,
                                                    fontWeight:
                                                    FontWeight
                                                        .w500,
                                                    color: ColorX
                                                        .blackX))),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 2.w, right: 2.w, bottom: 0.5.h),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _asyncConfirmDialog(context);
                                    },
                                    child: Container(
                                      width: size.width * 0.25,
                                      decoration: BoxDecoration(
                                        color:
                                        const Color(0xffF4F501),
                                        borderRadius:
                                        BorderRadius.circular(
                                            8.w),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                            10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .center,
                                          children: [
                                            SvgPicture.asset(
                                              "image/delete2.svg",
                                              height:
                                              size.height * 0.025,
                                            ),
                                            SizedBox(
                                                width: size.width *
                                                    0.02),
                                            Text("Cancel",
                                                style: GoogleFonts
                                                    .quicksand(
                                                    fontSize: 12,
                                                    fontWeight:
                                                    FontWeight
                                                        .w600,
                                                    color: ColorX
                                                        .textColor)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      GoRouter.of(context).pushNamed(
                                          MyAppRouteConstants
                                              .bookBySchedule);
                                    },
                                    child: Container(
                                      width: size.width * 0.28,
                                      decoration: BoxDecoration(
                                        color:
                                        const Color(0xffF4F501),
                                        borderRadius:
                                        BorderRadius.circular(
                                            8.w),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                            10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .center,
                                          children: [
                                            SvgPicture.asset(
                                              "image/editinterface.svg",
                                              height:
                                              size.height * 0.025,
                                            ),
                                            //SizedBox(width: size.width*0.02),
                                            Text("Reschedule",
                                                style: GoogleFonts
                                                    .quicksand(
                                                    fontSize: 12,
                                                    fontWeight:
                                                    FontWeight
                                                        .w600,
                                                    color: ColorX
                                                        .textColor)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor:
                                    const Color(0xffF4F501),
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                        "image/call.svg",
                                        height: size.height * 0.025,
                                        color:
                                        const Color(0xff22477B),
                                      ),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor:
                                    const Color(0xffF4F501),
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                        "image/message.svg",
                                        height: size.height * 0.025,
                                        color:
                                        const Color(0xff22477B),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
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
                Text('Are you sure',
                    style: GoogleFonts.quicksand(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: const Color(0XFFE53535))),
                Text('Delete this Service',
                    style: GoogleFonts.quicksand(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: const Color(0XFFE53535))),
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
                            child: Text('Cancel',
                                style: GoogleFonts.quicksand(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: ColorX.textColor))),
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
                                      fontSize: 8,
                                      fontWeight: FontWeight.w700,
                                      color: ColorX.whiteX))),
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
