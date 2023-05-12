import 'package:allohuggy/Service_provider/Routes/routes.dart';
import 'package:allohuggy/Service_provider/Utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

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
                              Text('Your Services',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: ColorX.buttonColor,
                                      fontWeight: FontWeight.w800)),
                              Row(
                                children: [
                                  Container(
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
            child: ListView.builder(
                itemCount: 2,
                padding: EdgeInsets.zero,
                itemBuilder: (context , index){
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          GoRouter.of(context).pushNamed(MyAppRouteConstants.serviceDetailsClient);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorX.whiteX,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Stack(
                                        children:[
                                          Container(
                                            height: size.height*0.04,
                                            width: size.width*0.25,
                                            decoration: const BoxDecoration(
                                                color:  Color(0xff22477B),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(20),
                                                  bottomRight: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                )
                                            ),
                                          ),
                                          const Positioned(
                                            top: 11,
                                            left: 15,
                                            child: CircleAvatar(
                                              radius: 3,
                                              backgroundColor: Colors.yellow,
                                            ),
                                          ),
                                          const Positioned(
                                            left: 25,
                                            top: 8,
                                            child: Text("in-progress",style: TextStyle(fontSize: 10,color: Colors.white),),
                                          ),
                                        ]
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const CircleAvatar(
                                        radius: 40,
                                        backgroundImage: AssetImage("image/Rectangle 1933.png"),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:  [
                                             Text("Sophie R. Stevens",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp),),
                                             Text("(Plumber/Cleaner)",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 10.sp),),
                                            SizedBox(
                                                width: 70.w,
                                                child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry",textAlign: TextAlign.justify,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12.sp))),

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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          _asyncConfirmDialog(context);
                                        },
                                        child: Container(
                                          width: size.width*0.3,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffF4F501),
                                            borderRadius: BorderRadius.circular(8.w),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(13.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset("image/delete2.svg",height: size.height*0.025,),
                                                SizedBox(width: size.width*0.02),
                                                const Text("Cancel"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          GoRouter.of(context).pushNamed(MyAppRouteConstants.bookBySchedule);
                                        },
                                        child: Container(
                                          width: size.width*0.35,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffF4F501),
                                            borderRadius: BorderRadius.circular(8.w),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(13.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset("image/editinterface.svg",height: size.height*0.025,),
                                                SizedBox(width: size.width*0.02),
                                                const Text("Reschedule"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 25,
                                        backgroundColor: const Color(0xffF4F501),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset("image/call.svg",height: size.height*0.025,color: const Color(0xff22477B),),
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 25,
                                        backgroundColor: const Color(0xffF4F501),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset("image/message.svg",height: size.height*0.025,color: const Color(0xff22477B),),
                                        ),
                                      ),


                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
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
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.w)
          ),
          content: SizedBox(
            height: 35.h,
            width: 100.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('image/Group 16401.png',height: 15.h,),
                ),
                Text('Are you sure',style: TextStyle(color: const Color(0XFFE53535),fontSize: 18.sp,fontWeight: FontWeight.w700),),
                Text('Delete this Service',style: TextStyle(color: const Color(0XFFE53535),fontSize: 18.sp,fontWeight: FontWeight.w700),),
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
                          borderRadius: BorderRadius.circular(8.w)
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(child: Text('Cancle',style: TextStyle(color: ColorX.textColor,fontWeight: FontWeight.w500,fontSize: 12.sp),)),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop(true);
                      },
                      child: Container(
                        width: 30.w,
                        decoration: BoxDecoration(
                            color: Color(0XFFE53535),
                            borderRadius: BorderRadius.circular(8.w)
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(child: Text('Delete',style: TextStyle(color: ColorX.whiteX,fontWeight: FontWeight.w500,fontSize: 12.sp))),
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

