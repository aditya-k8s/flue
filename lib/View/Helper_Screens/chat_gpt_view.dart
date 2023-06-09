import 'dart:convert';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Resources/colors.dart';
import 'ChatMessage.dart';
import 'package:http/http.dart' as http;

class ChatGptScreen extends StatefulWidget {
  const ChatGptScreen({Key? key}) : super(key: key);


  @override
  State<ChatGptScreen> createState() => _ChatGptScreenState();
}

class _ChatGptScreenState extends State<ChatGptScreen> {
  final bool _showBottomSheet = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController _controller = TextEditingController();
  final List < ChatMessage > _message = [];

  String apiKey = "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";
  Future < void > _sendMessage() async {
    // Create Create ChatMessage Class object and pass the user input
    ChatMessage message = ChatMessage(text: _controller.text, sender: "user");
    // Refresh the page
    setState(() {
      _message.insert(0, message);
    });
    // clear the user input from text-field
    _controller.clear();
    // Call the generateText method and store result into response
    final response = await generateText(message.text);
    // Create Create ChatMessage Class object and pass the bot output
    ChatMessage botMessage = ChatMessage(text: response.toString(), sender: "bot");
    // Refresh the page
    setState(() {
      _message.insert(0, botMessage);
    });
  }

  Widget _buidTextComposer() {
    return Row(children: [
      Expanded(child: TextField(controller: _controller, decoration: InputDecoration.collapsed(hintText: "Type a message"), ), ),
      IconButton(onPressed: () {
        _sendMessage();
      }, icon: Icon(Icons.send))
    ], ).px12();
  }

  Future < String > generateText(String prompt) async {
    // Here we have to create body based on the document
    try {
      Map < String, dynamic > requestBody = {
        "model": "text-davinci-003",
        "prompt": prompt,
        "temperature": 0,
        "file": EditFile('',''),
        "max_tokens": 100,
      };
      // Post Api Url
      var url = Uri.parse('https://api.openai.com/v1/completions');
      //  use post method of http and pass url,headers and body according to documents
      var response = await http.post(url, headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey"
      }, body: json.encode(requestBody)); // post call
      // Checked we get the response or not
      // if status code is 200 then Api Call is Successfully Executed
      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        return responseJson["choices"][0]["text"];
      } else {
        return "Failed to generate text: ${response.body}";
      }
    } catch (e) {
      return "Failed to generate text: $e";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: SizedBox(
                    height: 60.h,
                    width: 100.w,
                    child: Column(
                      children: [Flexible(child: ListView.builder(padding: Vx.m8, reverse: true, itemBuilder: (context, index) {
                        return _message[index];
                      }, itemCount: _message.length, ))],
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
                          width: 80.w,
                          decoration: BoxDecoration(
                              color: ColorX.whiteX,
                              borderRadius: BorderRadius.circular(2.w)),
                          child: _buidTextComposer()),

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
