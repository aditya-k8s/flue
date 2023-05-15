import 'package:allohuggy/Service_provider/Utilities/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../../../Utilities/colors.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
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
                        Text('Craftsmen Rating',
                            style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: ColorX.buttonColor)),
                      ],
                    ),
                  )),
            ],
          ),

          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 5.h,top: 3.h),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorX.whiteX,
                  borderRadius: BorderRadius.circular(3.w)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: ColorX.textColor,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Plumbing Store',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: ColorX.blackX),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'How is your Service?',
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: ColorX.blackX),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          5,
                          (index) => Icon(
                                Icons.star_outlined,
                                size: 44,
                                color: ColorX.buttonColor,
                              )),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w, right: 4.w),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffEFEFF2),
                            borderRadius: BorderRadius.circular(2.w)),
                        height: 15.h,
                        width: 100.w,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: const InputDecoration.collapsed(
                                hintText: 'Additional comments...'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w, right: 4.w),
                      child: CommonButton(
                        height: 7.h,
                        buttonText: 'Submit Review',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
