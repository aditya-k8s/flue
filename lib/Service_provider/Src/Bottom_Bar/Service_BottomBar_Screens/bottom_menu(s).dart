import 'package:allohuggy/Service_provider/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../Utilities/colors.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
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
                        Padding(
                          padding: EdgeInsets.only(right: 4.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Check your job',
                                  style: GoogleFonts.poppins(
                                      fontSize: 24,
                                      color: ColorX.whiteX,
                                      fontWeight: FontWeight.w600)),
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
                        Text('Near you',
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
                    left: 18.0, top: 6, bottom: 4, right: 18),
                child: TextField(
                  textAlign: TextAlign.left,
                  autocorrect: false,
                  decoration: InputDecoration(
                          hintText: 'Search',
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
          Padding(
            padding: EdgeInsets.only(right: 4.w, top: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.location_on,
                  color: ColorX.textColor,
                ),
                Text('Map View',
                    style: GoogleFonts.quicksand(
                        fontSize: 16,
                        color: ColorX.textColor,
                        fontWeight: FontWeight.w700))
              ],
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(10, (index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5.w, right: 5.w),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.w)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 3.w, right: 2.w, top: 0.h),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 70,
                                        child: CircleAvatar(
                                          radius: 50,

                                          backgroundColor:
                                              ColorX.scaffoldBackGroundX,
                                          child: Image.asset(
                                              'image/Rectangle 1876.png', width: 69,height: 69,),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 3.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Sophie R. Stevens",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  color: ColorX.blackX,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              "(Service : Plumber)",
                                              style: GoogleFonts.quicksand(
                                                  fontSize: 14,
                                                  color: ColorX.blackX,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            FittedBox(
                                              child: Text(
                                                  "Lorem Ipsum is simply ",
                                                  textAlign: TextAlign.justify,
                                                  overflow: TextOverflow.fade,
                                                  softWrap: true,
                                                  maxLines: 5,
                                                  style: GoogleFonts.quicksand(
                                                      fontSize: 12,
                                                      color: ColorX.blackX,
                                                      fontWeight: FontWeight.w500)),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 2,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: ColorX.buttonColor,
                                          borderRadius:
                                              BorderRadius.circular(8.w)),
                                      child: Padding(
                                        padding: EdgeInsets.all(1.h),
                                        child: Row(
                                          children: [
                                            Text('Inprogress', style: GoogleFonts.quicksand(
                                                fontSize: 12,
                                                color: ColorX.blackX,
                                                fontWeight: FontWeight.w600),),
                                            Icon(Icons.arrow_drop_down),
                                          ],
                                        ),
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: ColorX.buttonColor,
                                      child: Image.asset(
                                          'image/current_location.png'),
                                    ),
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: ColorX.buttonColor,
                                      child: SvgPicture.asset('image/call.svg'),
                                    ),
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: ColorX.buttonColor,
                                      child: SvgPicture.asset(
                                          'image/message1.svg'),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        GoRouter.of(context).pushNamed(
                                            MyAppRouteConstants.historyDetails);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: ColorX.textColor)),
                                        child: Padding(
                                          padding: EdgeInsets.all(2.2.h),
                                          child: SvgPicture.asset(
                                              'image/Vector10.svg'),
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
                }),
              ),
            ),
          )

          // Expanded(
          //   child: ListView.builder(
          //     itemCount: 20,
          //       shrinkWrap: true,
          //   itemBuilder: (context,index){
          //     return Column(
          //       mainAxisSize: MainAxisSize.min,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Padding(
          //           padding:  EdgeInsets.only(left: 5.w,right: 5.w),
          //           child: Container(
          //             decoration: BoxDecoration(
          //                 color: Colors.white,
          //                 borderRadius: BorderRadius.circular(4.w)
          //             ),
          //             child: Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Padding(
          //                     padding:  EdgeInsets.only(left: 3.w,right: 2.w,top: 0.h),
          //                     child: Row(
          //                       children: [
          //                         CircleAvatar(
          //                           radius: 50,
          //                           backgroundColor: ColorX.scaffoldBackGroundX,
          //                           child: Image.asset('image/Rectangle 1876.png'),
          //                         ),
          //                         Padding(
          //                           padding:  EdgeInsets.only(left: 3.w),
          //                           child: Column(
          //                             crossAxisAlignment: CrossAxisAlignment.start,
          //                             children: [
          //                               Text("Sophie R. Stevens",style: TextStyle(color: ColorX.blackX,fontSize: 16.sp,fontWeight: FontWeight.w800),),
          //                               Text("(Service : Plumber)",style: TextStyle(color: ColorX.blackX,fontSize: 14.sp,fontWeight: FontWeight.w400),),
          //                               FittedBox(
          //                                 child: Text("Lorem Ipsum is simply ",textAlign: TextAlign.justify,overflow: TextOverflow.fade, softWrap: true,
          //                                     maxLines: 5,style: TextStyle(color: ColorX.blackX,fontSize: 10.sp,fontWeight: FontWeight.w300)),
          //                               ),
          //
          //                             ],
          //                           ),
          //                         )
          //                       ],
          //                     ),
          //                   ),
          //                   Divider(thickness: 2,),
          //                   Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     children: [
          //                       Container(
          //                         decoration: BoxDecoration(
          //                             color: ColorX.buttonColor,
          //                             borderRadius: BorderRadius.circular(8.w)
          //                         ),
          //                         child: Padding(
          //                           padding:  EdgeInsets.all(1.h),
          //                           child: Row(
          //                             children: const [
          //                               Text('Inprogress'),
          //                               Icon(Icons.arrow_drop_down),
          //                             ],
          //                           ),
          //                         ),
          //                       ),
          //                       CircleAvatar(
          //                         radius: 25,
          //                         backgroundColor: ColorX.buttonColor,
          //                         child: Image.asset('image/current_location.png'),
          //                       ),
          //                       CircleAvatar(
          //                         radius: 25,
          //                         backgroundColor: ColorX.buttonColor,
          //                         child: SvgPicture.asset('image/call.svg'),
          //                       ),
          //                       CircleAvatar(
          //                         radius: 25,
          //                         backgroundColor: ColorX.buttonColor,
          //                         child: SvgPicture.asset('image/message1.svg'),
          //                       ),
          //                       Container(
          //                         decoration: BoxDecoration(
          //                             shape: BoxShape.circle,
          //                             border: Border.all(color: ColorX.textColor)
          //                         ),
          //                         child: Padding(
          //                           padding:  EdgeInsets.all(2.2.h),
          //                           child: SvgPicture.asset('image/Vector10.svg'),
          //                         ),
          //                       )
          //                     ],
          //                   )
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //         SizedBox(
          //           height: 1.h,
          //         )
          //       ],
          //     );
          //   }),
          // )
        ],
      ),
    );
  }
}
