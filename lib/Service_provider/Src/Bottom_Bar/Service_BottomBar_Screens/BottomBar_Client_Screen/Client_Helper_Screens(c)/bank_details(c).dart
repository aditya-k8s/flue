import 'package:allohuggy/Service_provider/Utilities/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../../../Utilities/colors.dart';

class BankDetailsClient extends StatefulWidget {
  const BankDetailsClient({Key? key}) : super(key: key);

  @override
  State<BankDetailsClient> createState() => _BankDetailsClientState();
}

class _BankDetailsClientState extends State<BankDetailsClient> {
  bool select = false;

  List<String> reportList = [
    "open now",
    "breakfast",
    "Wheelchair accessible",
    "pickup",
    "liquor",
    "coffee",
    "drive thru",
    "table service",
  ];

  int selectColor = 0;
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
                    padding: EdgeInsets.only(left: 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        SizedBox(
                          height: 2.h,
                        ),
                        Text('Bank Details',
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
            padding:  EdgeInsets.only(left: 4.w,right: 4.w),
            child: Container(
              decoration: BoxDecoration(
                color: ColorX.whiteX,
                borderRadius: BorderRadius.circular(2.w)
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Amount to be paid',style: TextStyle(color: ColorX.blackX,fontSize: 13.sp,fontWeight: FontWeight.w600),),
                    Text('\$30',style: TextStyle(color: ColorX.blackX,fontSize: 13.sp,fontWeight: FontWeight.w600))
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 45.h,
              child: Padding(
                padding:  EdgeInsets.only(left: 4.w,right: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your Cards',style: TextStyle(color: ColorX.blackX,fontSize: 15.sp,fontWeight: FontWeight.w600)),
                    Expanded(
                      child:ListView.builder(
                           itemCount: 3+1,
                          itemBuilder: (context,index){
                             if(index != 3){
                               return Column(
                                 children: [
                                   GestureDetector(
                                     onTap: (){
                                       setState(() {
                                         selectColor = index;
                                       });
                                     },
                                     child: Container(
                                       decoration: BoxDecoration(
                                           color: ColorX.whiteX,
                                           border: selectColor != index?Border.all(color: Colors.transparent):   Border.all(color: Color(0xff427F2D))
                                       ),
                                       child: Padding(
                                         padding: const EdgeInsets.all(15.0),
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             Row(
                                               children: [
                                                 Image.asset('image/Ask Mastercard Logo.png'),
                                                 SizedBox(
                                                   width: 2.w,
                                                 ),
                                                 Text("1234567890123456".replaceRange(0, 12,"**** **** ****"),style: TextStyle(color: ColorX.blackX,fontSize: 12.sp,fontWeight: FontWeight.w800),)
                                               ],
                                             ),
                                             selectColor != index?Container(): Container(
                                               decoration: const BoxDecoration(
                                                   shape: BoxShape.circle,
                                                   color: Color(0xff427F2D)
                                               ),
                                               child: Padding(
                                                 padding: const EdgeInsets.all(4.0),
                                                 child: Icon(Icons.check,color: ColorX.whiteX,),
                                               ),
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
                             }
                        return  Container(
                          decoration: BoxDecoration(
                            color: ColorX.whiteX,
                            //border:    Border.all(color: Color(0xff427F2D))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset('image/social-color-1-logo-paypal.svg'),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text("williamsmith@bernice.info",style: TextStyle(color: ColorX.blackX,fontSize: 12.sp,fontWeight: FontWeight.w800),)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),

                  ],
                ),
              )),
          Padding(
            padding:  EdgeInsets.only(left: 7.w,right: 7.w),
            child: Container(
              decoration: BoxDecoration(
                color: ColorX.whiteX,
                border: Border.all(color: ColorX.textColor),
                borderRadius: BorderRadius.circular(8.w)
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorX.textColor
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(Icons.add,color: ColorX.whiteX,),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text('Add Another Bank Account',style: TextStyle(color: ColorX.textColor,fontWeight: FontWeight.w700,fontSize: 14.sp),)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: BottomSheet(
        backgroundColor: const Color(0xffE3EFFF),
        onClosing: () {
        },
        builder: (context) {
          return Container(
            height: 10.h,
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
                  Text("\$60",style: TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.bold),),
                  GestureDetector(
                    onTap: (){
                      _asyncConfirmDialog(context);
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
                  )
                ],
              ),
            ),
          );
        },
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

                Text('Payment Successful',style: TextStyle(color: const Color(0XFF427F2D),fontSize: 18.sp,fontWeight: FontWeight.w700)),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SvgPicture.asset('image/Icon.svg',height: 14.h,),
                ),

                Text('Transaction Id: #12583355DFG456',style: TextStyle(color: ColorX.blackX,fontSize: 11.sp,fontWeight: FontWeight.w400),),
                RichText(
                    text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Amount Paid:',style: TextStyle(color: ColorX.blackX,fontSize: 11.sp,fontWeight: FontWeight.w400),
                    ),

                    TextSpan(
                      text: ' \$30',style: TextStyle(color: ColorX.blackX,fontSize: 11.sp,fontWeight: FontWeight.bold)
                    ),
                  ]
                )),
                //Text('Amount Paid : \$30',style: TextStyle(color: ColorX.blackX,fontSize: 10.sp,fontWeight: FontWeight.w400),),
                SizedBox(
                  height: 2.h,
                ),
               GestureDetector(
                 onTap: (){
                   Navigator.of(context).pop();
                   _asyncConfirmDialogSuccess(context);
                 },
                 child: Padding(
                   padding:  EdgeInsets.only(left: 5.w,right: 5.w),
                   child: CommonButton(
                     height: 7.h,
                     buttonText: 'Okay',
                   ),
                 ),
               )
              ],
            ),
          ),
        );
      },
    );
  }
  _asyncConfirmDialogSuccess(BuildContext context) async {
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

                Text('Booking Successful',style: TextStyle(color: const Color(0XFF427F2D),fontSize: 18.sp,fontWeight: FontWeight.w700)),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset('image/Icon.svg',height: 12.h,),
                ),

                Text('Your Request has been \nsuccessfully sent.',textAlign: TextAlign.center,style: TextStyle(color: ColorX.blackX,fontSize: 11.sp,fontWeight: FontWeight.w400),),

                Text('The craftsmen will call you back.',style: TextStyle(color: ColorX.blackX,fontSize: 10.sp,fontWeight: FontWeight.w400),),
                SizedBox(
                  height: 2.h,
                ),
               GestureDetector(
                 onTap: (){
                   Navigator.of(context).pop();
                 },
                 child: Padding(
                   padding:  EdgeInsets.only(left: 5.w,right: 5.w),
                   child: CommonButton(
                     height: 7.h,
                     buttonText: 'Okay',
                   ),
                 ),
               )
              ],
            ),
          ),
        );
      },
    );
  }
}
