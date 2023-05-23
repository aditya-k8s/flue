import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../../Resources/colors.dart';
import '../../../../../Utilities/Routes/routes.dart';

class ServiceProfileClient extends StatefulWidget {
  const ServiceProfileClient({Key? key}) : super(key: key);

  @override
  State<ServiceProfileClient> createState() => _ServiceProfileClientState();
}

class _ServiceProfileClientState extends State<ServiceProfileClient> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
     backgroundColor: ColorX.scaffoldBackGroundX,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_back,
                                        color: ColorX.whiteX, size: 3.h),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      GoRouter.of(context).pushNamed(MyAppRouteConstants.supportScreen);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 8.w),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: ColorX.whiteX,
                                                  width: 2)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: SvgPicture.asset(
                                              'image/chatgpt.svg',
                                              color: Colors.white,
                                            ),
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
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
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text('Charles J.Smith',
                            style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w600,color: ColorX.buttonColor)),
                      ],
                    ),
                  )),
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: size.width*0.89,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: ColorX.scaffoldBackGroundX,
                                  child: Image.asset('image/Rectangle 1876.png'),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(left: 3.w),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Charles J. Smith",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600,color: ColorX.blackX)),
                                          //Text('( Plumber )',style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w600,color: ColorX.buttonColor))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 0.5.h,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star_border_outlined,color: ColorX.textColor),
                                          Text('4.6 (313 Review)',style: GoogleFonts.quicksand(fontSize: 10,fontWeight: FontWeight.w600,color: ColorX.blackX))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 0.5.h,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.location_on_outlined,color: ColorX.textColor,),
                                          Text('35 minutes away',style: GoogleFonts.quicksand(fontSize: 10,fontWeight: FontWeight.w600,color: ColorX.blackX))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 0.5.h,
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(left: 1.w),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset('image/tick3.svg',height: 2.h,),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            Text('342 jobs completed',style: GoogleFonts.quicksand(fontSize: 10,fontWeight: FontWeight.w600,color: ColorX.blackX))
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                            const Divider(thickness: 2,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Language:",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w600,color: ColorX.blackX)),
                                    Text("Status:",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w600,color: ColorX.blackX)),
                                    Text("Services:",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w600,color: ColorX.blackX)),
                                  ],
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(left: 2.w),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("English, French",style:GoogleFonts.quicksand(fontSize: 14,fontWeight: FontWeight.w500,color: ColorX.blackX)),
                                      Text("Available",style: GoogleFonts.quicksand(fontSize: 14,fontWeight: FontWeight.w500,color: ColorX.blackX)),
                                      Text("Plumbing, home cleaning",style: GoogleFonts.quicksand(fontSize: 14,fontWeight: FontWeight.w500,color: ColorX.blackX)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text('About us',style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600,color: ColorX.blackX)),
                            Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. LoremIpsum has been the industrys standarddummy text ever since the... Read More',style:  GoogleFonts.quicksand(fontSize: 14,fontWeight: FontWeight.w700,color: ColorX.blackX))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text("4.6",style:  GoogleFonts.poppins(fontSize: 48,fontWeight: FontWeight.w600,color: ColorX.blackX)),
                    ),
                     Text("based on 313 Reviews",style:  GoogleFonts.quicksand(fontSize: 14,fontWeight: FontWeight.w600,color: ColorX.blackX)),
                    SizedBox(
                      height: 1.h,
                    ),
                    SizedBox(
                      height: 22.h*10,
                      width: size.width,
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: 1,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index){
                            return Padding(
                              padding:  EdgeInsets.only(left: 4.w,right: 4.w,bottom: 0,top: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              const CircleAvatar(
                                                radius: 25,
                                                backgroundImage: AssetImage("image/Rectangle 1876.png"),
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 8.0),
                                                        child: Text("Anna Glukkhikh",style:  GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w600,color: ColorX.blackX)),
                                                      ),
                                                      SizedBox(
                                                        width: 20.w,
                                                      ),
                                                       Text("1 day ago",style:  GoogleFonts.quicksand(fontSize: 12,fontWeight: FontWeight.w700,color: ColorX.blackX),),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 8.0),
                                                    child: Row(
                                                        children: List.generate(5, (index) => const Icon(Icons.star,color: Color(0xffFABE12),))
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                         Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.",style:  GoogleFonts.quicksand(fontSize: 12,fontWeight: FontWeight.w500,color: ColorX.blackX),),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 1.h,
                    )
                  ],
                ),
              ))

        ],
      ),

      bottomSheet: BottomSheet(
        backgroundColor: const Color(0xffE3EFFF),
        onClosing: () {
        },
        builder: (context) {
          return Container(
            height: size.height*0.08,
            width: double.infinity,
            alignment: Alignment.center,
            decoration:  BoxDecoration(
                color: const Color(0xff22477B),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.w),
                  topRight: Radius.circular(5.w),
                )
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Row(
                     children: [
                       Text("\$60",style: TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.bold),),
                     ],
                   ),
                   Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          GoRouter.of(context).pushNamed(MyAppRouteConstants.bookServiceClient);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(8.w),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text("Book Now",style: TextStyle(color: Color(0xff22477B),fontWeight: FontWeight.w500,fontSize: 14.sp),),
                          ),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: ColorX.buttonColor,
                                  width: 2)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              'image/call.svg',
                              color: ColorX.buttonColor,
                            ),
                          )),
                      SizedBox(width: 2.w),
                      Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: ColorX.buttonColor,
                                  width: 2)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              'image/message1.svg',
                              color: ColorX.buttonColor,
                            ),
                          )),
                    ],
                  )

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
