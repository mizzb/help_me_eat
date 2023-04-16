import 'package:feed_me/view/list/list_controller.dart';
import 'package:get/get.dart';

class ListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ListController(), permanent: false);
  }
}
