import 'package:get/get.dart';
import 'package:getx/Home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(HomeController());
  }
}
