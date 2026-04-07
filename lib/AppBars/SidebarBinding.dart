import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppBarController.dart';

class SidebarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppBarController(), permanent: true);

  }
}