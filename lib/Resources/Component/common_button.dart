import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../colors.dart';

class CommonButton extends StatelessWidget {
 final double? height;
 final String? buttonText;
 final bool? loading;
 final VoidCallback? onPress;
 const CommonButton({Key? key,this.height,this.buttonText,this.loading,this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:height,
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        color: ColorX.buttonColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 3,
            blurRadius: 4,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Center(
            child:loading==true?  Center(child: CircularProgressIndicator(color: ColorX.textColor,)): Text(buttonText!,style: GoogleFonts.quicksand(color: ColorX.textColor,fontWeight:FontWeight.w700,fontSize: 16),)),
      ),
    );
  }
}
