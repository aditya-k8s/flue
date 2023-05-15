import 'package:allohuggy/Service_provider/Routes/routes.dart';
import 'package:allohuggy/Service_provider/Utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class BottomWalletHistory extends StatefulWidget {
  const BottomWalletHistory({Key? key}) : super(key: key);

  @override
  State<BottomWalletHistory> createState() => _BottomWalletHistoryState();
}

class _BottomWalletHistoryState extends State<BottomWalletHistory>
    with TickerProviderStateMixin {
  late TabController? tabController;
  int selectIndex = 0;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    tabController!.addListener(() {
      setState(() {
        selectIndex = tabController!.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
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
                    padding: EdgeInsets.only(left: 5.w, right: 5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 20.sp,
                                  color: ColorX.whiteX,
                                )),
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
                        Text('Wallet & History',
                            style: GoogleFonts.poppins(
                                fontSize: 24,
                                color: ColorX.whiteX,
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 6.w, right: 6.w),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorX.scaffoldBackGroundX,
                  border: Border.all(color: ColorX.blackX),
                  borderRadius: BorderRadius.circular(8.w)),
              child: DefaultTabController(
                length: 2,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: TabBar(
                      indicator: selectIndex == 0
                          ? BoxDecoration(
                        color: ColorX.buttonColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.w),
                          bottomLeft: Radius.circular(8.w),
                        ),
                      )
                          : BoxDecoration(
                        color: ColorX.buttonColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.w),
                          bottomRight: Radius.circular(8.w),
                        ),
                      ),
                      controller: tabController,
                      tabs: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.credit_card,
                                color: ColorX.textColor,
                              ),
                              SizedBox(width: 1.w),
                              Text('TRANSACTION',
                                  style: GoogleFonts.quicksand(
                                      color: ColorX.textColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.history,
                                color: ColorX.textColor,
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text('HISTORY',
                                  style: GoogleFonts.quicksand(
                                      color: ColorX.textColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12))
                            ],
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ),

          Expanded(
            child: TabBarView(
                controller: tabController,
                children: [transaction(), history()]),
          )
        ],
      ),
    );
  }

  Widget transaction() {
    return Padding(
      padding: EdgeInsets.only(left: 5.w, right: 5.w,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Your Transactions',
                      style: GoogleFonts.poppins(
                          color: ColorX.blackX,
                          fontWeight: FontWeight.w600,
                          fontSize: 14)),
                ],
              ),
              GestureDetector(
                onTap: (){
                  print('next');
                  GoRouter.of(context).pushNamed(MyAppRouteConstants.bankDetails);
                },
                child: Row(
                  children: [
                    Text('Your Cards',
                        style: GoogleFonts.poppins(
                            color: ColorX.blackX,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600,
                            fontSize: 14)),
                    const Icon(Icons.arrow_forward_ios, size: 16, )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(10, (index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(3.w)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorX.underLineColor
                                          ),
                                          width: 40,
                                          height: 40,
                                          child: Center(child: Text("S",textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: ColorX.whiteX),)),

                                        ),
                                        SizedBox(width: 10,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Sophie R. Stevens',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    color: ColorX.blackX,
                                                    fontWeight: FontWeight.w600)),
                                            Text('Today, 2023 at 10:02am',
                                                style: GoogleFonts.quicksand(
                                                    fontSize: 14,
                                                    color: ColorX.grayX,
                                                    fontWeight: FontWeight.w600))
                                          ],
                                        ),
                                      ],
                                    ),

                                    Text('+\$100',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: Color(0xFF008000),
                                            fontWeight: FontWeight.w600))
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
                }),
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget history() {
    return Padding(
      padding:  EdgeInsets.only(left: 4.w,right: 4.w,top: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your History',
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: ColorX.blackX,
                  fontWeight: FontWeight.w600)),
          SizedBox(
            height: 1.h,
          ),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(10, (index) {
                    return Column(
                      children: [
                        Container(

                          width: 100.w,
                          decoration: BoxDecoration(
                              color: ColorX.whiteX,
                              borderRadius: BorderRadius.circular(4.w)
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(left: 5.w,top: 2.h),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 5,
                                      backgroundColor: ColorX.textColor,
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Text('Date : 23April,2023',
                                        style: GoogleFonts.quicksand(
                                            fontSize: 12,
                                            color: ColorX.blackX,
                                            fontWeight: FontWeight.w600))
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor: ColorX.textColor,
                                    ),

                                    Padding(
                                      padding:  EdgeInsets.only(left: 4.w),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Sophie R. Stevens',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  color: ColorX.blackX,
                                                  fontWeight: FontWeight.w600)),
                                          Text('Service : Cleaning & Plumbing',
                                              style: GoogleFonts.quicksand(
                                                  fontSize: 12,
                                                  color: ColorX.blackX,
                                                  fontWeight: FontWeight.w600)),
                                          Text('Status : Complete',
                                              style: GoogleFonts.quicksand(
                                                  fontSize: 12,
                                                  color: ColorX.blackX,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Divider(),
                                Padding(
                                  padding:  EdgeInsets.only(right: 5.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset('image/money-1.svg',height: 4.h),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text('\$75.00',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  color: ColorX.textColor,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),

                                      GestureDetector(
                                        onTap: (){
                                          print("history");
                                          GoRouter.of(context).pushNamed(MyAppRouteConstants.historyDetails);
                                        },
                                        child: Row(
                                          children: [
                                            Text('View Full Details',
                                                style: GoogleFonts.quicksand(
                                                    fontSize: 14,
                                                    color: ColorX.blackX,
                                                    fontWeight: FontWeight.w600)),
                                            Icon(Icons.arrow_forward_ios,size: 15,color: ColorX.blackX,)
                                          ],
                                        ),
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
                        )
                      ],
                    );
                  }),
                ),
              )
          )
        ],
      ),
    );
  }
}
