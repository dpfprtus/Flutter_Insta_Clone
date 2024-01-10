import 'package:flutter_clone_instagram/src/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    //app 종료시점까지 인스턴스가 살아있게 처리
    Get.put(BottomNavController(), permanent: true);
  }
}
