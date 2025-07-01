import 'package:get/get.dart';
import 'package:image_search/a_common/controller/common_layout_controller.dart';

class CommonLayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommonLayoutController());
  }
}