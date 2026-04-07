import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_website/AppBars/AppBarController.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/Keys.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppBarController>();

    // Masla Fix: Agar screen resize ho kar Web par jaye to Drawer band ho jaye
    if (AppSizes.isWeb(context)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (AppKeys.scaffoldKey.currentState?.isDrawerOpen ?? false) {
          Navigator.of(context).pop();
        }
      });
    }

    return Drawer(
      width: 300,
      backgroundColor: Colors.white,
      elevation: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- CLOSE ICON ---
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close, size: 30, color: Colors.black),
                  onPressed: () => AppKeys.scaffoldKey.currentState?.closeDrawer(),
                ),
              ),
              const SizedBox(height: 30),

              // --- NAV ITEMS ---
              _drawerNavItem("Home", controller, context, '/'),
              _drawerNavItem("Cars", controller, context, '/cars'),
              _drawerNavItem("Services", controller, context, '/services'),
              _drawerNavItem("About Us", controller, context, '/About'),
              _drawerNavItem("FAQ's", controller, context, '/FAQs'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerNavItem(String title, AppBarController controller, BuildContext context, String path) {
    return Obx(() {
      bool isActive = controller.activeNav.value == title;
      return InkWell(
        onTap: () {
          controller.setActive(title);
          if (AppKeys.scaffoldKey.currentState?.isDrawerOpen ?? false) {
            Navigator.of(context).pop(); // Auto-close
          }
          context.go(path); // Navigation
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? const Color(0xFFFF3850) : Colors.black,
              fontSize: 20,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      );
    });
  }
}