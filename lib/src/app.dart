import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';
import 'package:flutter_clone_instagram/src/controller/bottom_nav_controller.dart';
import 'package:flutter_clone_instagram/src/pages/active_history.dart';
import 'package:flutter_clone_instagram/src/pages/home.dart';
import 'package:flutter_clone_instagram/src/pages/mypage.dart';
import 'package:flutter_clone_instagram/src/pages/search.dart';
import 'package:get/get.dart';

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    //뒤로가기
    return WillPopScope(
      onWillPop: controller.willPopAction,
      child: Obx(
        () => Scaffold(
          body: IndexedStack(index: controller.pageIndex.value, children: [
            const Home(),
            Navigator(
              key: controller.searchPageNavigationKey,
              onGenerateRoute: (routeSetting) {
                return MaterialPageRoute(
                  builder: (context) => const Search(),
                );
              },
            ),
            Container(),
            const ActiveHistory(),
            const MyPage(),
          ]),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: controller.pageIndex.value,
            elevation: 0,
            onTap: controller.changeBottomNav,
            items: [
              BottomNavigationBarItem(
                icon: ImageData(IconPath.homeOff),
                activeIcon: ImageData(IconPath.homeOn),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconPath.searchOff),
                activeIcon: ImageData(IconPath.searchOn),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconPath.uploadIcon),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconPath.activeOff),
                activeIcon: ImageData(IconPath.activeOn),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                label: 'home',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
