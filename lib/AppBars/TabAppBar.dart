import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppBarController.dart';
import 'package:vendor_website/AppBars/Widgets/PrimaryBtnOfAppbars.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/IconString.dart';
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
        color: AppColors.backgroundOfScreenColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              AppKeys.scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              size: 28,
              color: AppColors.textColor,
            ),
          ),
          _signUpButton(context, controller)

        ],
      ),
    );
  }

   /// --------- Extra widget
  // Signup Button
  Widget _signUpButton(BuildContext context, AppBarController controller) {
    return PrimaryBtnOfAppbars(
      height: 45,
      text: "Sign up",
      onTap: () {
        controller.setActive("Signup");
      },
      borderRadius: BorderRadius.circular(10),
      icon: SvgPicture.asset(
        IconString.signUp,
        colorFilter: const ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn),
      ),
      isIconLeft: true,
    );
  }
}