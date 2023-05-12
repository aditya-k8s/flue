import 'package:allohuggy/Service_provider/Utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class ChatGptScreen extends StatefulWidget {
  const ChatGptScreen({Key? key}) : super(key: key);

  @override
  State<ChatGptScreen> createState() => _ChatGptScreenState();
}

class _ChatGptScreenState extends State<ChatGptScreen> {
  final bool _showBottomSheet = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        backgroundColor: ColorX.scaffoldBackGroundX,
        body: Column(
          children: [
            Stack(
              children: [
                SvgPicture.asset(
                  'image/Vector (2).svg',
                  fit: BoxFit.fitWidth,
                  width: 100.w,
                ),
                Positioned(
                    top: 0.h,
                    left: 0,
                    right: 0,
                    bottom: 8.h,
                    child: Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _scaffoldKey.currentState!.openDrawer();
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: ColorX.whiteX, width: 2)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.menu,
                                          color: ColorX.whiteX,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  "Chatgpt",
                                  style: TextStyle(
                                      fontSize: 25.sp,
                                      color: ColorX.whiteX,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.only(right: 5.w),
                                child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: ColorX.whiteX, width: 2)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.add,
                                        color: ColorX.whiteX,
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
            Text('Welcome to Chatgpt',
                style: TextStyle(
                    fontSize: 25.sp,
                    color: ColorX.blackX,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: SizedBox(
                height: 60.h,
                width: 100.w,
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(10, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            color: ColorX.whiteX,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                'Lorem Ipsum is simply dummy text of the printing  printing  printing  printing  printing  printing  printing  printing and typesetting industry.',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: ColorX.blackX,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp),
                              ),
                            )),
                      );
                    }),
                  ),
                ),
              ),
            )),
          ],
        ),
        bottomSheet: BottomSheet(
            elevation: 10,
            backgroundColor: ColorX.textColor,
            enableDrag: false,
            onClosing: () {},
            builder: (BuildContext ctx) => Container(
                  width: double.infinity,
                  height: 10.h,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xff3E9BF8),
                            borderRadius: BorderRadius.circular(3.w)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SvgPicture.asset('image/Subtract.svg'),
                        ),
                      ),
                      Container(
                          width: 60.w,
                          decoration: BoxDecoration(
                              color: ColorX.whiteX,
                              borderRadius: BorderRadius.circular(2.w)),
                          child: TextFormField(
                            cursorColor: ColorX.blackX,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Type a message...'),
                          )),
                      Icon(
                        Icons.send,
                        color: ColorX.whiteX,
                        size: 4.h,
                      )
                    ],
                  ),
                )),
        drawer:Drawer(
          elevation: 0,
          width: 80.w,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.w),
              bottomRight: Radius.circular(20.w)
            )
          ),
          backgroundColor: ColorX.whiteX,
          child: Column(
            children: [
              SizedBox(
                height: 6.h,
              ),
              Padding(
                padding:  EdgeInsets.only(left: 4.w,right: 6.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorX.buttonColor,
                    borderRadius: BorderRadius.circular(3.w)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 2.h,
                          backgroundColor: ColorX.textColor,
                          child: Icon(Icons.add,size: 2.h,),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text('New Chat',style: TextStyle(color: ColorX.textColor,fontSize: 14.sp,fontWeight: FontWeight.w700),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.w,
              ),
              SizedBox(
                height: 40.h,
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(20, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SvgPicture.asset('image/chat3.svg'),
                            SizedBox(width: 2.w),
                            Expanded(child: Text('EduTech Website Wireframe',textAlign: TextAlign.justify,style: TextStyle(color: ColorX.blackX,fontSize: 12.sp,fontWeight: FontWeight.w600)))
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(
                height: 2.w,
              ),
              const Divider(thickness: 2,),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.asset('image/delete2.svg',height: 3.h,),
                    SizedBox(width: 3.w),
                    Text('Clear Conversations',style: TextStyle(color: ColorX.blackX,fontSize: 12.sp,fontWeight: FontWeight.w600))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('image/questionmark.svg',height: 3.h,),
                        SizedBox(width: 3.w),
                        Text('Upgrade to plus',style: TextStyle(color: ColorX.blackX,fontSize: 12.sp,fontWeight: FontWeight.w600))
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff3E9BF8),
                        borderRadius: BorderRadius.circular(2.w)
                      ),
                      child: Center(child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('12',style: TextStyle(color: ColorX.whiteX,fontWeight: FontWeight.w600,fontSize: 12.sp),),
                      )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.settings,color: ColorX.blackX,size: 3.h,),
                    SizedBox(width: 3.w),
                    Text('Settings',style: TextStyle(color: ColorX.blackX,fontSize: 12.sp,fontWeight: FontWeight.w600))
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.asset('image/sharelogo.svg',height: 3.h,),
                    SizedBox(width: 3.w),
                    Text('Get Help',style: TextStyle(color: ColorX.blackX,fontSize: 12.sp,fontWeight: FontWeight.w600))
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.asset('image/logout.svg',height: 3.h,),
                    SizedBox(width: 3.w),
                    Text('Log out',style: TextStyle(color: ColorX.blackX,fontSize: 12.sp,fontWeight: FontWeight.w600))
                  ],
                ),
              ),

            ],
          ),
        ) ,

    );
  }
}
