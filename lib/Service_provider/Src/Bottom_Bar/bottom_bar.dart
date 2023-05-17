import 'dart:collection';
import 'package:allohuggy/Service_provider/Utilities/colors.dart';
import 'package:allohuggy/Service_provider/Utilities/shred_helper.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../Blocs/Bottom_Bar_Bloc/bottom_bar_cubit.dart';
import 'Service_BottomBar_Screens/BottomBar_Client_Screen/bottom_bar_homePage(c).dart';
import 'Service_BottomBar_Screens/BottomBar_Client_Screen/bottom_bar_service(c).dart';
import 'Service_BottomBar_Screens/BottomBar_Client_Screen/bottom_bar_service_history.dart';
import 'Service_BottomBar_Screens/bottom_bar_profile(c).dart';
import 'Service_BottomBar_Screens/bottom_menu(s).dart';
import 'Service_BottomBar_Screens/bottom_profile(s).dart';
import 'Service_BottomBar_Screens/bottom_service(s).dart';
import 'Service_BottomBar_Screens/bottom_wallet_history(s).dart';

int? newIndex;

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
  final List<Widget> bottomBarClient = [
    const HomePageClient(),
    const BottomServiceClient(),
    const ServiceHistoryClient(),
    const BottomProfileClient(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ShredHelper.feedType=='USER'?PageView(
          controller: _pageController,
          //physics: const NeverScrollableScrollPhysics(),
          children: List.generate(bottomBarPagesService.length,
                  (index) => bottomBarClient[index]),
        ):PageView(
          controller: _pageController,
         // physics: const NeverScrollableScrollPhysics(),
          children: List.generate(bottomBarPagesService.length,
              (index) => bottomBarPagesService[index]),
        ),
        extendBody: true,
        bottomNavigationBar: AnimatedNotchBottomBar(
          color: ColorX.textColor,
          notchColor: ColorX.underLineColor,
          pageController: _pageController,
          bottomBarItems: [
            BottomBarItem(
              inActiveItem: Icon(
                Icons.home_outlined,
                color: ColorX.whiteX,
              ),
              activeItem: Icon(
                Icons.home_outlined,
                color: ColorX.whiteX,
              ),
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.home_repair_service,
                color: ColorX.whiteX,
              ),
              activeItem: Icon(
                Icons.home_repair_service,
                color: ColorX.whiteX,
              ),
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.work_history,
                color: ColorX.whiteX,
              ),
              activeItem: Icon(
                Icons.work_history,
                color: ColorX.whiteX,
              ),
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.person,
                color: ColorX.whiteX,
              ),
              activeItem: Icon(
                Icons.person,
                color: ColorX.whiteX,
              ),
            ),
          ],
          onTap: (index) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
        )
        // BottomNavigationBar(
        //   showSelectedLabels: false,
        //   showUnselectedLabels: false,
        //   backgroundColor: ColorX.textColor,
        //   selectedItemColor: ColorX.buttonColor,
        //   unselectedItemColor: const Color(0xFFC4C1C1),
        //   type: BottomNavigationBarType.fixed,
        //   currentIndex: index,
        //   onTap: (value) {
        //     _navigationQueue.addLast(index);
        //     setState(() => index = value);
        //     if (kDebugMode) {
        //
        //       newIndex = value;
        //       print('bottom is ${newIndex}');
        //     }
        //   },
        //   items: [
        //     BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.home_outlined,
        //           size: 8.w,
        //         ),
        //         label: "Home"),
        //     BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.home_repair_service,
        //           size: 8.w,
        //         ),
        //         label: "Home"),
        //     BottomNavigationBarItem(
        //         icon: Icon(
        //           Icons.work_history,
        //           size: 8.w,
        //         ),
        //         label: "Home"),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.person, size: 8.w), label: "Home"),
        //   ],
        // ),
        );
  }

  Widget? getBodyService(int index) {
    switch (index) {
      case 0:
        return const BottomMenu();
      case 1:
        return const BottomService();
      case 2:
        return const BottomWalletHistory();
      case 3:
        return const BottomProfile();
    }
    return null;
  }

  Widget? getBodyClient(int index) {
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
