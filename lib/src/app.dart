import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';
import 'package:flutter_clone_instagram/src/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    //뒤로가기
    return WillPopScope(
        child: Obx(
          () => Scaffold(
            appBar: AppBar(),
            body: IndexedStack(index: controller.pageIndex.value, children: [
              Container(
                child: const Center(child: Text('HOME')),
              ),
              Container(
                child: const Center(child: Text('SEARCH')),
              ),
              Container(
                child: const Center(child: Text('UPLOAD')),
              ),
              Container(
                child: const Center(child: Text('ACTIVITY')),
              ),
              Container(
                child: const Center(child: Text('MYPAGE')),
              ),
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
        onWillPop: () async {
          //true로 하면 뒤로가기 시 앱 종료
          return false;
        });
  }
}
