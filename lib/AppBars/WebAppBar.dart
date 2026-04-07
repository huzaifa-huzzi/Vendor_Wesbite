import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_website/AppBars/AppBarController.dart';
import 'package:vendor_website/AppBars/TabAppBar.dart';
import 'package:vendor_website/Resources/AppSizes.dart';

class WebAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WebAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {

    final AppBarController controller = Get.find<AppBarController>();

    if (AppSizes.isWeb(context)) {
      return _buildDesktopAppBar(context, controller);
    } else {
      return const TabAppBar();
    }
  }

  Widget _buildDesktopAppBar(BuildContext context, AppBarController controller) {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding(context)),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FB),
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _logoSection(),
          Obx(() => Row(
            children: [
              _navItem("Home", "/", controller, context),
              _navItem("Cars", "/cars", controller, context),
              _navItem("Services", "/services", controller, context),
              _navItem("About Us", "/About", controller, context),
              _navItem("FAQ's", "/FAQs", controller, context),
            ],
          )),
          _contactButton(context, controller),
        ],
      ),
    );
  }

  Widget _navItem(String title, String path, AppBarController controller, BuildContext context) {
    bool isActive = controller.activeNav.value == title;
    return InkWell(
      onTap: () {
        controller.setActive(title); // Red color update karega
        context.go(path);            // Screen ka data update karega (Navigation)
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title,
          style: TextStyle(
              color: isActive ? const Color(0xFFFF3850) : Colors.black87,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400
          ),
        ),
      ),
    );
  }
  Widget _logoSection() {
    return const Row(
      children: [
        Icon(Icons.directions_car_filled, color: Color(0xFFFF3850), size: 30),
        SizedBox(width: 8),
        Text('Car Rental', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700)),
      ],
    );
  }

  Widget _contactButton(BuildContext context, AppBarController controller) {
    return ElevatedButton(
      onPressed: () => controller.setActive("Contact"),
      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF3850), foregroundColor: Colors.white),
      child: const Text("Contact us"),
    );
  }

}