import 'package:allohuggy/Service_provider/Utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HistoryDetails extends StatefulWidget {
  const HistoryDetails({Key? key}) : super(key: key);

  @override
  State<HistoryDetails> createState() => _HistoryDetailsState();
}

class _HistoryDetailsState extends State<HistoryDetails> {
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
                                    Icons.notification_important,
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
            padding:  EdgeInsets.only(left: 4.w),
            child: Text('Your History',style: GoogleFonts.poppins(color: ColorX.blackX,fontWeight: FontWeight.w600,fontSize: 21),),
          ),
          SizedBox(
            height: 3.w,
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
                        Container(
                          width: 90,
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.indigo,
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text('Sophie R. Stevens',
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
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
                               Text('Status : Completed', style: GoogleFonts.quicksand(
                                       fontSize: 12,
                                       color: ColorX.blackX,
                                       fontWeight: FontWeight.w600))
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
                                Text('Date : 23April,2023', style: GoogleFonts.quicksand(
                                    fontSize: 12,
                                    color: ColorX.blackX,
                                    fontWeight: FontWeight.w600))
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
                                  child: Text('Time : 9:00AM TO 11:00AM', textAlign: TextAlign.justify,style: GoogleFonts.quicksand(
                                      fontSize: 12,
                                      color: ColorX.blackX,
                                      fontWeight: FontWeight.w600)),
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
                                Text('Payment : \$75', style: GoogleFonts.quicksand(
                                    fontSize: 12,
                                    color: ColorX.blackX,
                                    fontWeight: FontWeight.w600))
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
                        style: GoogleFonts.quicksand(
                            fontSize: 14,
                            color: ColorX.blackX,
                            fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: 1.w,
                    ),
                    Text('Description :',
                        style: GoogleFonts.quicksand(
                            fontSize: 14,
                            color: ColorX.blackX,
                            fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: 1.w,
                    ),
                    Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        style: GoogleFonts.quicksand(
                            fontSize: 12,
                            color: ColorX.blackX,
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 1.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                          child: Row(
                            children: List.generate(4, (index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 7.h,
                                    width: 17.w,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red
                                    ),
                                    child: Image.asset('image/Rectangle 1933.png',fit: BoxFit.contain,),
                                  ),
                                ],
                              );
                            }),
                          ),
                        )
                      ]
                    ),
                    SizedBox(
                      height: 1.w,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text('Address :',
                          style: GoogleFonts.quicksand(
                              fontSize: 14,
                              color: ColorX.blackX,
                              fontWeight: FontWeight.w700)),
                    ),

                    SizedBox(
                      height: 1.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 4),
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
                                  style: GoogleFonts.quicksand(
                                      fontSize: 12,
                                      color: ColorX.blackX,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        Padding(
                         padding:  EdgeInsets.only(left: 6,top: 0.4.h),
                         child: Column(
                           children: List.generate(4, (index) {
                             return Column(
                               children: [
                                 SizedBox(height: 1.h, child: const VerticalDivider(color: Colors.grey,thickness: 4,)),
                                 SizedBox(
                                   height: 0.3.h,
                                 )
                               ],
                             );

                           }),
                         ),
                       ),
                        Padding(
                          padding:  EdgeInsets.only(left: 2),
                          child: Row(
                            children: [
                              Icon(Icons.location_on , color: Colors.red, size: 25,),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text('105 William St, Chicago, US',
                                  style: GoogleFonts.quicksand(
                                      fontSize: 12,
                                      color: ColorX.blackX,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ],
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
