import 'package:allohuggy/Service_provider/Utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

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
                          style: TextStyle(
                              fontSize: 25.sp,
                              color: ColorX.whiteX,
                              fontWeight: FontWeight.w600),
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
                         style: TextStyle(
                             fontSize: 18.0,
                             fontWeight: FontWeight.w500,
                             color: ColorX.blackX),
                       ),
                       children:  <Widget>[
                         ListTile(
                           title: Text(
                             'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,',
                             style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12.sp,color: ColorX.blackX),
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
