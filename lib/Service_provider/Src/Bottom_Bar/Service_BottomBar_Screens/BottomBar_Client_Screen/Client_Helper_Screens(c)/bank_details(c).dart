import 'package:allohuggy/Service_provider/Utilities/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
                            style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w600,color: ColorX.buttonColor)),
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
                    Text('Amount to be paid',style: GoogleFonts.quicksand(fontSize: 17,fontWeight: FontWeight.w600,color: ColorX.blackX)),
                    Text('\$30',style: GoogleFonts.quicksand(fontSize: 17,fontWeight: FontWeight.w600,color: ColorX.blackX))
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
                    Text('Your Cards',style: GoogleFonts.poppins(fontSize: 21,fontWeight: FontWeight.w600,color: ColorX.blackX)),
                    SizedBox(
                      height: 1.h,
                    ),
                    Expanded(
                      child:ListView.builder(
                        padding: EdgeInsets.zero,
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
                                                 Text("1234567890123456".replaceRange(0, 12,"**** **** ****"),style: GoogleFonts.quicksand(fontSize: 17,fontWeight: FontWeight.w600,color: ColorX.blackX))
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
                                    Text("williamsmith@bernice.info",style: GoogleFonts.quicksand(fontSize: 17,fontWeight: FontWeight.w600,color: ColorX.blackX))
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
                    Text('Add Another Bank Account',style: GoogleFonts.quicksand(fontSize: 14,fontWeight: FontWeight.w700,color: ColorX.textColor))
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
                  Text("\$60",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600,color: ColorX.whiteX)),
                  GestureDetector(
                    onTap: (){
                      _asyncConfirmDialog(context);
                    },
                    child: Container(
                      width: 25.w,
                      height: 6.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(8.w),
                      ),
                      child: Text("Pay",style:GoogleFonts.quicksand(fontSize: 14,fontWeight: FontWeight.w700,color: ColorX.textColor)),
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
