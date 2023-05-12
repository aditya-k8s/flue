import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../Utilities/colors.dart';

class BankDetails extends StatefulWidget {
  const BankDetails({Key? key}) : super(key: key);

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
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
                                  print('object');
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
                        Text('Bank Details',
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: ColorX.whiteX,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  )),
            ],
          ),
          Padding(
            padding:  EdgeInsets.only(left: 4.w),
            child: Text('Your Cards',
                style: TextStyle(
                    fontSize: 20.sp,
                    color: ColorX.blackX,
                    fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 50.h,
            width: 100.w,
            child: Padding(
              padding:  EdgeInsets.only(left: 4.w,right: 4.w),
              child: SingleChildScrollView(
                child: Column(
                children: List.generate(100, (index) {
                  return Column(
                    children: [
                      Container(
                        color: ColorX.whiteX,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Image.asset('image/Ask Mastercard Logo.png'),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text("0171642266666666".replaceRange(0, 12,"**** **** ****"),style: TextStyle(color: ColorX.blackX,fontSize: 12.sp,fontWeight: FontWeight.w800),)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      )
                    ],
                  );
                }),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding:  EdgeInsets.only(left: 5.w,right: 5.w),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                color: ColorX.buttonColor
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.cancel,color: ColorX.textColor,),
                    Text('Add Another Bank Account',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14.sp,color: ColorX.textColor),)
                  ],
                ),
              ),
            ),
          )

        ],
      ),
    );
  }

}
