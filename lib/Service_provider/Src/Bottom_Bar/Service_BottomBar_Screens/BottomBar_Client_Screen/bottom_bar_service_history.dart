import 'package:allohuggy/Service_provider/Utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../Routes/routes.dart';

class ServiceHistoryClient extends StatefulWidget {
  const ServiceHistoryClient({Key? key}) : super(key: key);

  @override
  State<ServiceHistoryClient> createState() => _ServiceHistoryClientState();
}

class _ServiceHistoryClientState extends State<ServiceHistoryClient> {

  String dropdownvalue = 'Complete';
  var items = [
    'Complete',
    'Ashutosh',
    'Samriti',
    'Swastika',
  ];

  @override
  Widget build(BuildContext context) {
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Icon(Icons.arrow_back,
                                    color: ColorX.whiteX, size: 3.h),
                              ),
                              GestureDetector(
                                onTap: (){
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
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text('Service History',
                            style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w600,color: ColorX.buttonColor)),
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
                Text("Upcoming Services",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w600,color: ColorX.blackX)),
                DropdownButton(
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  elevation: 0,
                  underline: Container(),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items,style: GoogleFonts.quicksand(fontSize: 12,fontWeight: FontWeight.w700,color: ColorX.blackX),),
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
          Expanded(
              child:ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context,index){
                return Padding(
                  padding:  EdgeInsets.only(left: 3.w,right: 3.w),
                  child: Column(
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
                                    width: 3.w,
                                  ),
                                  Text('Date : 23April,2023',
                                      style: GoogleFonts.quicksand(fontSize: 10,fontWeight: FontWeight.w600,color: ColorX.blackX))
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
                                            style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600,color: ColorX.blackX)),
                                        Text('Service : Cleaning & Plumbing',
                                            style: GoogleFonts.quicksand(fontSize: 12,fontWeight: FontWeight.w600,color: ColorX.blackX)),
                                        Text('Status : Complete',
                                            style: GoogleFonts.quicksand(fontSize: 12,fontWeight: FontWeight.w600,color: ColorX.blackX)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              const Divider(),
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
                                            style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400,color: ColorX.blackX)),
                                      ],
                                    ),

                                    GestureDetector(
                                      onTap: (){
                                        print("history");
                                        GoRouter.of(context).pushNamed(MyAppRouteConstants.serviceHistoryDetailClient);
                                      },
                                      child: Row(
                                        children: [
                                          Text('View Full Details',
                                              style: GoogleFonts.quicksand(fontSize: 14,fontWeight: FontWeight.w600,color: ColorX.blackX)),
                                          Icon(Icons.arrow_forward_ios,size: 20,color: ColorX.blackX,)
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
                  ),
                );
              }) )
        ],
      ),
    );
  }
}
