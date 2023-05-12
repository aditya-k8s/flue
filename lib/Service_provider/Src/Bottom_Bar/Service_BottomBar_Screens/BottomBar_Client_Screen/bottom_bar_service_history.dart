import 'package:allohuggy/Service_provider/Utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
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
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Upcoming Services",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14.sp,color: ColorX.blackX),),
                DropdownButton(
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  elevation: 0,
                  underline: Container(),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
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
                                  width: 3.w,
                                ),
                                Text('Date : 23April,2023',
                                    style: TextStyle(
                                        fontSize: 10.sp,
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
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: ColorX.blackX,
                                              fontWeight: FontWeight.w600)),
                                      Text('Service : Cleaning & Plumbing',
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: ColorX.blackX,
                                              fontWeight: FontWeight.w400)),
                                      Text('Status : Complete',
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: ColorX.blackX,
                                              fontWeight: FontWeight.w400)),
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
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: ColorX.textColor,
                                              fontWeight: FontWeight.w400)),
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
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: ColorX.blackX,
                                                fontWeight: FontWeight.w400)),
                                        Icon(Icons.arrow_forward_ios,size: 12.sp,color: ColorX.blackX,)
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
              }) )
        ],
      ),
    );
  }
}
