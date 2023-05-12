import 'dart:async';
import 'dart:math';
import 'package:allohuggy/Service_provider/Utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
    ChatMessage(messageContent: "This is Flutter?", messageType: "receiver"),
    ChatMessage(messageContent: "This is Flutter?", messageType: "sender"),
    ChatMessage(messageContent: "This is Flutter 3.0?", messageType: "receiver"),
    ChatMessage(messageContent: "This is ", messageType: "sender"),
    ChatMessage(messageContent: " Flutter?", messageType: "receiver"),
    ChatMessage(messageContent: " 3.0?", messageType: "sender"),
  ];
  final ScrollController controller = ScrollController();

  @override
  void initState(){
    SchedulerBinding.instance!.addPostFrameCallback((_) {
    controller.animateTo(
        controller.position.minScrollExtent,
        duration: const Duration(milliseconds: 1),
        curve: Curves.fastOutSlowIn);
  });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              child: SingleChildScrollView(
                child: SizedBox(
                  height:messages.length*8.h,
                  width: 100.w,
                  child: ListView.builder(
                    controller:controller,
                    itemCount: messages.length,
                    shrinkWrap: true,
                    padding:  EdgeInsets.zero,
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
              )),
          Container(
            width: double.infinity,
            height: 12.h,
            color: ColorX.textColor,
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
                      onTap: (){

                      },
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
          )
        ],
      ),
    );
  }
}

class ChatMessage {
  String? messageContent;
  String? messageType;
  ChatMessage({@required this.messageContent, @required this.messageType});
}

class ChatUI extends StatefulWidget {
  createState() => _ChatUIState();
}

class _ChatUIState extends State<ChatUI> {
  final List<String> _messages = [];
  Timer? _timer;
  final ScrollController _scrollController = ScrollController();
  bool _needsScroll = false;
  static const List<String> _possibleMessages = [
    "Hi!",
    "Hello.",
    "Bye forever!",
    "I'd really like to talk to you.",
    "Have you heard the news?",
    "I see you're using our website. Can I annoy you with a chat bubble?",
    "I miss you.",
    "I never want to hear from you again.",
    "You up?",
    ":-)",
    "ok",
  ];
  final Random _random = Random();

  @override
  reassemble() {
    super.reassemble();
    _timer?.cancel();
    _startTimer();
  }

  @override
  initState() {
    super.initState();
    _startTimer();
  }

  @override
  dispose() {
    _timer?.cancel();
    super.dispose();
  }

  _addMessage() {
    _messages.add(_possibleMessages[_random.nextInt(_possibleMessages.length)]);
  }

  _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      setState(() {
        _addMessage();
        _needsScroll = true;
      });
    });
  }

  _scrollToEnd() async {
    if (_needsScroll) {
      _needsScroll = false;
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
    }
  }

  build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToEnd());
    return ListView(
      controller: _scrollController,
      children: _messages.map((msg) => ChatBubble(msg)).toList(),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String? text;

  const ChatBubble(this.text, {Key? key}) : super(key: key);

  @override
  build(_) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        width: 200,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(8.0)),
        margin: const EdgeInsets.only(bottom: 10, right: 10),
        child: Text(text!),
      ),
    );
  }
}