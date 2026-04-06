import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppBarController.dart';

class WebAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WebAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    // Controller ko find karna
    final AppBarController controller = Get.put(AppBarController());

    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 950; // Thora margin barha diya hai links ke liye

    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FB),
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // --- LOGO ---
          Row(
            children: [
              const Icon(Icons.directions_car_filled, color: Color(0xFFFF3850), size: 32),
              const SizedBox(width: 10),
              const Text(
                'Car Rental',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          // --- NAV ITEMS (Dynamic) ---
          if (!isMobile)
            Obx(() => Row(
              children: [
                _navItem("Home", controller),
                _navItem("Cars", controller),
                _navItem("Services", controller),
                _navItem("About Us", controller),
                _navItem("FAQ's", controller),
              ],
            )),

          // --- ACTION BUTTON / MENU ---
          isMobile
              ? IconButton(icon: const Icon(Icons.menu), onPressed: () {})
              : ElevatedButton.icon(
            onPressed: () {
              controller.setActive("Contact"); // Click par active state change
            },
            icon: const Icon(Icons.phone_in_talk_outlined, size: 18),
            label: const Text("Contact us"),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF3850),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  // Nav Item Widget with Hover/Click logic
  Widget _navItem(String title, AppBarController controller) {
    bool isActive = controller.activeNav.value == title;

    return InkWell(
      onTap: () {
        controller.setActive(title);
      },
      hoverColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? const Color(0xFFFF3850) : Colors.black87,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}