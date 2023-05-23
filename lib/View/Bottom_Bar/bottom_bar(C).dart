import 'dart:collection';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';
import 'package:sizer/sizer.dart';
import '../../Resources/colors.dart';
import 'Service_BottomBar_Screens/BottomBar_Client_Screen/bottom_bar_homePage(c).dart';
import 'Service_BottomBar_Screens/BottomBar_Client_Screen/bottom_bar_service(c).dart';
import 'Service_BottomBar_Screens/BottomBar_Client_Screen/bottom_bar_service_history.dart';
import 'Service_BottomBar_Screens/bottom_bar_profile(c).dart';

class BottomBarClient extends StatefulWidget {
  const BottomBarClient({Key? key}) : super(key: key);

  @override
  State<BottomBarClient> createState() => _BottomBarClientState();
}

class _BottomBarClientState extends State<BottomBarClient> {

  final _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int maxCount = 4;
  final List bottomBarClient = [
    const HomePageClient(),
    const BottomServiceClient(),
    const ServiceHistoryClient(),
    const BottomProfileClient(),
  ];

  final ListQueue<int> _navigationQueue = ListQueue();
int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:PageView(
          controller: _pageController,
          children: List.generate(bottomBarClient.length, (index) => bottomBarClient[index])
        ),
        extendBody: true,
        bottomNavigationBar: RollingBottomBar(
          controller: _pageController,
          flat: true,
          color: ColorX.textColor,
          itemColor: ColorX.whiteX,
          useActiveColorByDefault: false,
          items: [
             RollingBottomBarItem(Icons.home,  activeColor: ColorX.buttonColor),
             RollingBottomBarItem(Icons.feed_outlined,  activeColor:ColorX.buttonColor),
             RollingBottomBarItem(Icons.pending_actions,  activeColor:ColorX.buttonColor),
             RollingBottomBarItem(Icons.person, activeColor: ColorX.buttonColor),
          ],
          enableIconRotation: true,
          onTap: (index) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOut,
            );
          },
        ),
    );
  }
  Widget? getBody(int index) {
    switch (index) {
      case 0:
        return const HomePageClient();
      case 1:
        return const BottomServiceClient();
      case 2:
        return const ServiceHistoryClient();
      case 3:
        return const BottomProfileClient();
    }
    return null;
  }
}
