import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppBarController.dart';
import 'package:vendor_website/Resources/AppSizes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Resources/Keys.dart';

class TabAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TabAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    final AppBarController controller = Get.find<AppBarController>();

    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding(context)),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FB),
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Isse Menu left aur Button right ho jayega
        children: [
          // --- LEFT: HAMBURGER MENU ---
          IconButton(
            onPressed: () {
              AppKeys.scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              size: 28,
              color: Color(0xFF333333),
            ),
          ),

          // --- RIGHT: SIGN UP BUTTON ---
          ElevatedButton.icon(
            onPressed: () {
              controller.setActive("Signup");
            },
            icon: const Icon(Icons.person_outline, size: 20),
            label: const Text(
              "Sign up",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF3850),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Sharp rounded corners
              ),
            ),
          ),
        ],
      ),
    );
  }
}