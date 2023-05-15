import 'package:allohuggy/Service_provider/Routes/routes.dart';
import 'package:allohuggy/Service_provider/Utilities/common_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../../../Utilities/colors.dart';

class BookServiceClient extends StatefulWidget {
  const BookServiceClient({Key? key}) : super(key: key);

  @override
  State<BookServiceClient> createState() => _BookServiceClientState();
}

class _BookServiceClientState extends State<BookServiceClient> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          height: 1.h,
                        ),
                        Text('Service Request',
                            style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w600,color: ColorX.buttonColor)),
                      ],
                    ),
                  )),
            ],
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      "Type of Service",
                      style: GoogleFonts.quicksand(fontSize: 14,fontWeight: FontWeight.w700,color: ColorX.blackX),
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
                              child: Image.asset('image/Rectangle 1876.png',fit: BoxFit.fill,),
                            ),
                             Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Plumbing',
                                style: GoogleFonts.quicksand(fontSize: 14,fontWeight: FontWeight.w500,color: ColorX.blackX),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                     Text(
                      "To the Craftsmen",
                      style: GoogleFonts.quicksand(fontSize: 14,fontWeight: FontWeight.w700,color: ColorX.blackX),
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
                              padding:  EdgeInsets.only(left: 3.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text("Charles J. Smith",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600,color: ColorX.blackX)),
                                      Text('( Plumber )',style: GoogleFonts.quicksand(fontSize: 12,fontWeight: FontWeight.w600,color: ColorX.blackX))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star_border_outlined,color: ColorX.textColor),
                                      Text('4.6 (313 Review)',style: GoogleFonts.quicksand(fontSize: 13,fontWeight: FontWeight.w600,color: ColorX.blackX))
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
                     Text(
                      "For What?",
                      style: GoogleFonts.quicksand(fontSize: 14,fontWeight: FontWeight.w700,color: ColorX.blackX),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              "Description",
                              style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600,color: ColorX.blackX),
                            ),
                            const Divider(thickness: 2,),
                            Text('Lorem Ipsum is simply dummy text of the printLorem Ipsum is simply dummy text of the printLorem Ipsum is simply dummy text of the printing and typesetting industry. LoremIpsum has been the industrys standard ',style: GoogleFonts.quicksand(fontSize: 14,fontWeight: FontWeight.w500,color: ColorX.blackX)),


                          ],
                        ),
                      ),
                    ),
                     Text(
                      "Photos",
                      style: GoogleFonts.quicksand(fontSize: 14,fontWeight: FontWeight.w700,color: ColorX.blackX),
                    ),

                    SizedBox(
                      height: 10.h,
                      child: ListView.builder(
                          itemCount: 3+1,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index){
                            if(index != 3){
                              return  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 7.h,
                                  width: 18.w,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle
                                  ),
                                  child: Image.asset('image/Rectangle 1935.png',fit: BoxFit.fill,),
                                ),
                              );
                            }
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DottedBorder(
                                borderType: BorderType.Oval,
                                dashPattern: const [10,5,10,5,10,5],
                                color: ColorX.underLineColor,
                                child: Container(
                                  height: 8.h,
                                  width: 17.w,
                                  decoration: BoxDecoration(
                                      color: ColorX.whiteX,
                                      shape: BoxShape.circle
                                  ),
                                  child: Image.asset('image/Vector.png',color: ColorX.underLineColor,),
                                ),
                              ),
                            );
                          }),
                    ),

                    GestureDetector(
                      onTap: (){
                        GoRouter.of(context).pushNamed(MyAppRouteConstants.bookBySchedule);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CommonButton(
                          height: 7.h,
                          buttonText: 'Select Schedule',
                        ),
                      ),
                    )


                  ],
                ),
              )),
        ],
      ),
    );
  }
}
