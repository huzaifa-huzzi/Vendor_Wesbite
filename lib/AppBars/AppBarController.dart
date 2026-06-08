import 'package:get/get.dart';

class AppBarController extends GetxController {
  var activeNav = 'Home'.obs;

  void setActive(String title) {
    activeNav.value = title;
  }
  void updateActiveNavByPath(String path) {
    if (path == '/') {
      activeNav.value = "Home";
    } else if (path.startsWith('/cars') || path == '/CarDetail') {
      activeNav.value = "Cars";
    } else if (path.startsWith('/services') ||
        path == '/generalMaintenance' ||
        path == '/engineServices' ||
        path == '/brakeService' ||
        path == '/tyreService' ||
        path == '/acServices' ||
        path == '/batteryServices') {
      activeNav.value = "Services";
    } else if (path == '/About') {
      activeNav.value = "About Us";
    } else if (path == '/FAQs') {
      activeNav.value = "FAQ's";
    } else {
      activeNav.value = '';
    }
  }
}