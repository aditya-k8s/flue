import 'package:allohuggy/Resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    Key ? key,
    required this.text,
    required this.sender
  }): super(key: key);
  // Use for User Input and chatbot output
  final String text;
  // Use for check sender is user or bot
  final String sender;
  @override
  Widget build(BuildContext context) {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: sender == 'user'?MainAxisAlignment.end:MainAxisAlignment.start,
      children: [
      // Text(sender).text.subtitle1(context).make().box.color(sender == 'user' ? ColorX.grayX : ColorX.darkBlue).p16.rounded.alignCenter.makeCentered(),
      SizedBox(
      // color: ColorX.whiteX,
        width: 300,

      child: Container(
        padding: const EdgeInsets.all(10.0),
        // decoration: BoxDecoration(borderRadius:BorderRadius.all(Radius.circular(10)), color: sender == 'user'?ColorX.textColor:ColorX.whiteX ),

        child: Text(
            text.trim(),
            textAlign: sender == 'user'?TextAlign.end:TextAlign.start,
            style: TextStyle(
                color: sender == 'user'?ColorX.grayX:ColorX.blackX,
                fontWeight: FontWeight.w400,
                fontSize: 11.sp),
          ),
      ))
    ], );
  }
}