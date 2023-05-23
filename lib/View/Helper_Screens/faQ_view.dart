import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../Resources/colors.dart';
import '../../View_Model_Data/user_prefences.dart';


class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  var isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body:UserPrefences.feedType=='USER'? Column(
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
                  top: 6.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop(true);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 25.sp,
                              color: ColorX.whiteX,
                            )),
                        Text(
                          "FAQ’s",
                          style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w600,color: ColorX.buttonColor),
                        )
                      ],
                    ),
                  )),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(10, (index) {
                  return  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorX.whiteX,
                          borderRadius: BorderRadius.circular(2.w)),
                      child: ExpansionTile(
                        iconColor: ColorX.blackX,
                        trailing: isExpanded
                            ? Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: ColorX.textColor)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.keyboard_arrow_up_outlined,
                                size: 3.h,
                                color: ColorX.textColor,
                              ),
                            ))
                            : Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: ColorX.textColor)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.keyboard_arrow_down,
                                  size: 3.h, color: ColorX.textColor),
                            )),
                        backgroundColor: ColorX.whiteX,
                        title: Text(
                          'What is lorem ipsum',
                          style: GoogleFonts.quicksand(fontSize: 15,fontWeight: FontWeight.w600,color: ColorX.blackX),
                        ),
                        children:  <Widget>[
                          ListTile(
                            title: Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,',
                              style: GoogleFonts.quicksand(fontSize: 12,fontWeight: FontWeight.w500,color: ColorX.blackX),
                            ),
                          )
                        ],
                        onExpansionChanged: (bool expanded) {
                          setState(() => isExpanded = expanded);
                        },
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          )
        ],
      ): Column(
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
                  top: 6.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop(true);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 25.sp,
                              color: ColorX.whiteX,
                            )),
                        Text(
                          "FAQ’s",
                          style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w600,color: ColorX.whiteX),
                        )
                      ],
                    ),
                  )),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(10, (index) {
                  return  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorX.whiteX,
                          borderRadius: BorderRadius.circular(2.w)),
                      child: ExpansionTile(
                        iconColor: ColorX.blackX,
                        trailing: isExpanded
                            ? Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: ColorX.textColor)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.keyboard_arrow_up_outlined,
                                size: 3.h,
                                color: ColorX.textColor,
                              ),
                            ))
                            : Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: ColorX.textColor)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.keyboard_arrow_down,
                                  size: 3.h, color: ColorX.textColor),
                            )),
                        backgroundColor: ColorX.whiteX,
                        title: Text(
                          'What is lorem ipsum',
                          style: GoogleFonts.quicksand(fontSize: 15,fontWeight: FontWeight.w600,color: ColorX.blackX),
                        ),
                        children:  <Widget>[
                          ListTile(
                            title: Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,',
                              style: GoogleFonts.quicksand(fontSize: 12,fontWeight: FontWeight.w500,color: ColorX.blackX),
                            ),
                          )
                        ],
                        onExpansionChanged: (bool expanded) {
                          setState(() => isExpanded = expanded);
                        },
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          )
        ],
      ),
    );
  }
}
