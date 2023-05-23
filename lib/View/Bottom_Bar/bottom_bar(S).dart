import 'dart:collection';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';
import '../../Resources/colors.dart';
import 'Service_BottomBar_Screens/BottomBar_Client_Screen/bottom_bar_homePage(c).dart';
import 'Service_BottomBar_Screens/BottomBar_Client_Screen/bottom_bar_service(c).dart';
import 'Service_BottomBar_Screens/BottomBar_Client_Screen/bottom_bar_service_history.dart';
import 'Service_BottomBar_Screens/bottom_bar_profile(c).dart';
import 'Service_BottomBar_Screens/bottom_menu(s).dart';
import 'Service_BottomBar_Screens/bottom_profile(s).dart';
import 'Service_BottomBar_Screens/bottom_service(s).dart';
import 'Service_BottomBar_Screens/bottom_wallet_history(s).dart';



class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final ListQueue<int> _navigationQueue = ListQueue();

  final _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int maxCount = 4;
  final List<Widget> bottomBarPagesService = [
    const BottomMenu(),
    const BottomService(),
    const BottomWalletHistory(),
    const BottomProfile()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _pageController,
          //physics: const NeverScrollableScrollPhysics(),
          children: List.generate(bottomBarPagesService.length,
                  (index) => bottomBarPagesService[index]),
        ),
        extendBody: true,
        bottomNavigationBar:RollingBottomBar(
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

  // Widget? getBodyService(int index) {
  //   switch (index) {
  //     case 0:
  //       return const BottomMenu();
  //     case 1:
  //       return const BottomService();
  //     case 2:
  //       return const BottomWalletHistory();
  //     case 3:
  //       return const BottomProfile();
  //   }
  //   return null;
  // }
  //
  // Widget? getBodyClient(int index) {
  //   switch (index) {
  //     case 0:
  //       return const HomePageClient();
  //     case 1:
  //       return const BottomServiceClient();
  //     case 2:
  //       return const ServiceHistoryClient();
  //     case 3:
  //       return const BottomProfileClient();
  //   }
  //   return null;
  // }

}
