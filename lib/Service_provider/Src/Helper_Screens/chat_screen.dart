import 'package:allohuggy/Service_provider/Utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, messi", messageType: "receiver"),
    ChatMessage(messageContent: "How are you?", messageType: "receiver"),
    ChatMessage(messageContent: "Hey messi, I am doing fine dude. wru?", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(messageContent: "This is Flutter?", messageType: "sender"),
  ];

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
                          "Chat",
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
            child: ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(
                      left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment: (messages[index].messageType == "receiver"
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    child: Container(
                      decoration: messages[index].messageType == "receiver"
                          ? BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                  topRight: Radius.circular(10)),
                              color: (messages[index].messageType == "receiver"
                                  ? ColorX.whiteX
                                  : ColorX.textColor),
                            )
                          : BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(10)),
                              color: (messages[index].messageType == "receiver"
                                  ? ColorX.whiteX
                                  : ColorX.textColor),
                            ),
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        messages[index].messageContent.toString(),
                        style: TextStyle(
                            fontSize: 15,
                            color: messages[index].messageType == "receiver"
                                ? ColorX.blackX
                                : ColorX.whiteX),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
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
                      decoration: BoxDecoration(
                          color: const Color(0xff3E9BF8),
                          borderRadius: BorderRadius.circular(3.w)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SvgPicture.asset('image/Subtract.svg'),
                      ),
                    ),
                    Container(
                        width: 60.w,
                        decoration: BoxDecoration(
                            color: ColorX.whiteX,
                            borderRadius: BorderRadius.circular(2.w)),
                        child: TextFormField(
                          cursorColor: ColorX.blackX,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Type a message...'),
                        )),
                    Icon(
                      Icons.send,
                      color: ColorX.whiteX,
                      size: 4.h,
                    )
                  ],
                ),
              )),
    );
  }
}

class ChatMessage {
  String? messageContent;
  String? messageType;
  ChatMessage({@required this.messageContent, @required this.messageType});
}
