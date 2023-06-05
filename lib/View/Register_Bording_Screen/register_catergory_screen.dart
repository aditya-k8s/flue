import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../Resources/colors.dart';
import '../../Resources/Component/common_button.dart';
import '../../Utilities/Routes/routes.dart';

class RegisterCategoryScreen extends StatefulWidget {
  RegisterCategoryScreen({Key? key}) : super(key: key);

  @override
  State<RegisterCategoryScreen> createState() => _RegisterCategoryScreenState();
}

class _RegisterCategoryScreenState extends State<RegisterCategoryScreen> {
  List<String> reportList = [
    "Not relevant",
    "Illegal",
    "Mover/Packers",
    "Offensive",
    "Uncivila",
    "Uncivilb",
    "Uncivilc",
    "Uncivild",
    "Uncivile",
  ];

  List<String> selectedReportList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: ColorX.scaffoldBackGroundX,
          body: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      'image/Vector (2).svg',
                      fit: BoxFit.fitWidth,
                      width: 100.w,
                    ),
                  ),
                  Positioned(
                      top: 4.h,
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
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Registration",
                                style: GoogleFonts.poppins(
                                    fontSize: 32,
                                    color: ColorX.whiteX,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Artisan",
                                style: GoogleFonts.quicksand(
                                    fontSize: 34,
                                    color: ColorX.whiteX,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      )),
                ],
              ),
             Expanded(
                 child: SingleChildScrollView(
                   child: Column(
               children: [
                   Padding(
                     padding: EdgeInsets.only(left: 6.w, right: 4.w),
                     child: Container(
                       decoration: BoxDecoration(
                           color: ColorX.whiteX,
                           border: Border.all(color: ColorX.underLineColor),
                           borderRadius: BorderRadius.circular(8.w)),
                       child: Padding(
                         padding: const EdgeInsets.only(left: 18.0, top: 4, bottom:1, right: 15),
                         child: TextField(
                           textAlign: TextAlign.left,
                           autocorrect: false,
                           decoration:
                           //disable single line border below the text field
                           InputDecoration(
                               hintText: 'Search Services',
                               hintStyle: GoogleFonts.roboto(color: ColorX.blackX, fontWeight: FontWeight.w400, fontSize: 15),
                               border: InputBorder.none,
                               suffixIcon: Icon(Icons.search,
                                   color: ColorX.underLineColor)),
                           style: GoogleFonts.roboto(
                               color: ColorX.blackX,
                               fontSize: 15, fontWeight: FontWeight.w400),
                         ),
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 1.h,
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: SizedBox(
                       width: 100.w,
                       child: MultiSelectChip(
                         reportList,
                         onSelectionChanged: (selectedList) {
                           setState(() {
                             selectedReportList = selectedList;
                           });
                         },
                         maxSelection: 10,
                       ),),
                   ),
                   GestureDetector(
                     onTap: (){
                       GoRouter.of(context).pushNamed(MyAppRouteConstants.registerForm);
                     },
                     child: Padding(
                       padding:  EdgeInsets.only(left: 8.w,right: 8.w),
                       child: CommonButton(
                         height: 6.h,
                         buttonText: 'FOLLOWING',
                       ),
                     ),
                   ),
                   GestureDetector(
                     onTap: () {
                       GoRouter.of(context)
                           .pushNamed(MyAppRouteConstants.loginScreen);
                     },
                     child: Padding(
                       padding:  EdgeInsets.only(top: 1.h,bottom: 2.h),
                       child: Text("I have an account",style: GoogleFonts.quicksand(color: ColorX.textNew,fontSize: 16,fontWeight: FontWeight.w500,decoration: TextDecoration.underline)),
                     ),
                   )
               ],
             ),
                 ))
            ],
          ),
        );


  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>)? onSelectionChanged;
  final Function(List<String>)? onMaxSelected;
  final int? maxSelection;
  const MultiSelectChip(this.reportList, {super.key, this.onSelectionChanged, this.onMaxSelected, this.maxSelection});
  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  List<String> selectedChoices = [];
  _buildChoiceList() {
    List<Widget> choices = [];
    for (var item in widget.reportList) {
      choices.add(
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ChoiceChip(
              backgroundColor: ColorX.whiteX,
              selectedColor: ColorX.textColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1.w)
              ),
              avatar: Padding(
                padding:  EdgeInsets.only(left: 1.w),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: const Color(0xffFFDAA7),
                  child: SvgPicture.asset('image/Vector.svg'),
                ),
              ),
              label: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(item,style: TextStyle(color:ColorX.blackX)),
              ),
              selected: selectedChoices.contains(item),
              onSelected: (selected) {
                if(selectedChoices.length == (widget.maxSelection  ?? -1) && !selectedChoices.contains(item)) {
                  widget.onMaxSelected?.call(selectedChoices);
                } else {
                  setState(() {
                    selectedChoices.contains(item)
                        ? selectedChoices.remove(item)
                        : selectedChoices.add(item);
                    widget.onSelectionChanged?.call(selectedChoices);
                  });
                }
              },
            ),
          ));
    }

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}


