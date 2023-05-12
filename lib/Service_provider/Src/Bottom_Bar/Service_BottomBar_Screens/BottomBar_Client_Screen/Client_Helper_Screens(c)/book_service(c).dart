import 'package:allohuggy/Service_provider/Routes/routes.dart';
import 'package:allohuggy/Service_provider/Utilities/common_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
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
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_back,
                                        color: ColorX.whiteX, size: 3.h),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
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
                                  SizedBox(
                                    width: 2.w,
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
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text('Service Request',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: ColorX.buttonColor,
                                fontWeight: FontWeight.w800)),
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
                const Text(
                  "Type of Service",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
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
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Plumbing',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 17),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Text(
                  "to the Craftsmen",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
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
                                  Text("Charles J. Smith",style: TextStyle(color: ColorX.blackX,fontSize: 14.sp,fontWeight: FontWeight.w700),),
                                  Text('( Plumber )',style: TextStyle(color: ColorX.blackX,fontSize: 10.sp,fontWeight: FontWeight.w400),)
                                ],
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star_border_outlined,color: ColorX.textColor),
                                  Text('4.6 (313 Review)',style: TextStyle(color: ColorX.blackX,fontSize: 10.sp,fontWeight: FontWeight.w600))
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
                const Text(
                  "For What?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
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
                        const Text(
                          "Description",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                        ),
                        Divider(thickness: 2,),
                        Text('Lorem Ipsum is simply dummy text of the printLorem Ipsum is simply dummy text of the printLorem Ipsum is simply dummy text of the printing and typesetting industry. LoremIpsum has been the industrys standard ',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 11.sp)),


                      ],
                    ),
                  ),
                ),
                const Text(
                  "Photos",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
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
