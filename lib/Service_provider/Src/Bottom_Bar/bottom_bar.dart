import 'dart:collection';
import 'package:allohuggy/Service_provider/Utilities/colors.dart';
import 'package:allohuggy/Service_provider/Utilities/shred_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../Blocs/Bottom_Bar_Bloc/bottom_bar_cubit.dart';
import 'Service_BottomBar_Screens/BottomBar_Client_Screen/bottom_bar_homePage(c).dart';
import 'Service_BottomBar_Screens/BottomBar_Client_Screen/bottom_bar_service(c).dart';
import 'Service_BottomBar_Screens/BottomBar_Client_Screen/bottom_bar_service_history.dart';
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

  int index = 0;
  @override
  Widget build(BuildContext context) {
    final BottomBarCubit cubit = BlocProvider.of<BottomBarCubit>(context);
    final PageController controller = PageController();
    return Scaffold(
      body: ShredHelper.feedType=="USER"? getBodyClient(index):getBodyService(index),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: ColorX.textColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xFFC4C1C1),
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (value) {
          _navigationQueue.addLast(index);
          setState(() => index = value);
          if (kDebugMode) {
            print(value);
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 8.w,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_repair_service,
                size: 8.w,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.work_history,
                size: 8.w,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 8.w), label: "Home"),
        ],
      ),


    );
  }

  Widget? getBodyService(int index) {
    switch (index) {
      case 0:
        return  const BottomMenu();
      case 1:
        return const BottomService();
      case 2:
        return const BottomWalletHistory();
      case 3:
        return const BottomProfile();
    }
    return null;
  }

  Widget? getBodyClient(int index){
    switch (index) {
      case 0:
        return const  HomePageClient();
      case 1:
        return const BottomServiceClient();
      case 2:
        return const ServiceHistoryClient();
      case 3:
        return Container(color: Colors.indigo,child: const Center(child: Text('this is clent sider pahe 4')),);
    }
    return null;
  }

}
