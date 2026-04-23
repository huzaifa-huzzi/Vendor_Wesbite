import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_website/AppBars/AppBarController.dart';
import 'package:vendor_website/AppBars/TabAppBar.dart';
import 'package:vendor_website/AppBars/Widgets/PrimaryBtnOfAppbars.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/IconString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:flutter_svg/flutter_svg.dart';


  class WebAppBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const WebAppBar({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
  final AppBarController controller = Get.find<AppBarController>();

  if (AppSizes.isWeb(context)) {
  return _buildDesktopAppBar(context, controller);
  } else {
  return TabAppBar(scaffoldKey: scaffoldKey);
  }
  }
   /// -------- Extra Widgets

   // Desktop Appbar
  Widget _buildDesktopAppBar(BuildContext context, AppBarController controller) {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding(context)),
      decoration: BoxDecoration(
        color: AppColors.backgroundOfScreenColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _logoSection(context),
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

   // Nav Items
  Widget _navItem(String title, String path, AppBarController controller, BuildContext context) {
    bool isActive = controller.activeNav.value == title;
    return InkWell(
      onTap: () {
        controller.setActive(title);
        context.go(path);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title,
          style: isActive ? TTextTheme.h2StylePrimary(context): TTextTheme.h2Style(context),
        ),
      ),
    );
  }
  // Logo Section

  Widget _logoSection(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          IconString.logo,
          height: 30,
          width: 30,
          colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
        ),
        const SizedBox(width: 8),
         Text(
          'Car Rental',
          style:TTextTheme.h2Style(context),
        ),
      ],
    );
  }

   // Contact Button
  Widget _contactButton(BuildContext context, AppBarController controller) {
    return PrimaryBtnOfAppbars(
      height: 45,
      text: "Contact us",
      onTap: () => controller.setActive("Contact"),
      borderRadius: BorderRadius.circular(10),
      icon: SvgPicture.asset(
        IconString.contact,
        colorFilter: const ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn),
      ),
      isIconLeft: true,
    );
  }

}