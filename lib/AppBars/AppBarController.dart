import 'package:get/get.dart';

class AppBarController extends GetxController {
  var activeNav = 'Home'.obs;

  void setActive(String title) {
    activeNav.value = title;
  }
}