import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/IconString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/AboutUs/AboutUsController.dart';

class HowItWorksWeb extends StatelessWidget {
  const HowItWorksWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AboutUsController());
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 850;
    final bool isTablet = width >= 850 && width < 1200;

    final double stepHeight = isMobile ? 260 : (isTablet ? 340 : 400);
    final double sectionHeight = stepHeight * 4;
    final double containerWidth = isMobile
        ? double.infinity
        : (isTablet ? width * 0.9 : 1000);
    final double horizontalPadding = isMobile ? 16 : (isTablet ? 32 : 50);
    final double verticalPadding = isMobile ? 60 : 100;
    final double headerSpacing = isMobile ? 50 : 100;

    return Container(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      color: AppColors.backgroundOfScreenColor,
      child: Column(
        children: [
          _buildHeader(context,isMobile, horizontalPadding),
          SizedBox(height: headerSpacing),
          SizedBox(
            key: controller.sectionKey,
            width: containerWidth,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 2,
                    color: AppColors.whiteColor,
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Obx(
                        () => AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 2,
                      height: sectionHeight * controller.scrollPercentage.value,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                Column(
                  children: [
                    _stepRow(context,1, "Select Car", "Browse our fleet and choose the car that suits your needs.", IconString.selectCar, controller, isMobile, stepHeight),
                    _stepRow(context,2, "Drive", "Step into your selected car and experience the ultimate comfort.", IconString.driveIcon, controller, isMobile, stepHeight),
                    _stepRow(context,3, "Booking", "Plan your rental by selecting your dates and preferred car.", IconString.bookingAboutIcon, controller, isMobile, stepHeight),
                    _stepRow(context,4, "Return", "Simply return the car at our office for a seamless experience.", IconString.returnCar, controller, isMobile, stepHeight),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// --- Extra Widget ------ ///

  // Step row
  Widget _stepRow(
      BuildContext context,
      int step,
      String title,
      String desc,
      String icon,
      AboutUsController controller,
      bool isMobile,
      double stepHeight,
      ) {
    final bool textOnRight = isMobile || step.isOdd;
    final double centerSpacerWidth = isMobile ? 60 : 100;

    return Container(
      key: controller.stepKeys[step - 1],
      height: stepHeight,
      child: Obx(() {
        final bool isActive = controller.activeStep.value == step;

        if (isMobile) {
          return Row(
            children: [
              const Expanded(child: SizedBox.shrink()),
              SizedBox(width: centerSpacerWidth),
              Expanded(
                child: _stepMobileContent(context,step, title, desc, icon, isActive),
              ),
            ],
          );
        }

        final text = _stepText(context,step, title, desc, isActive, textOnRight);
        final iconBadge = _stepIcon(icon, isActive, iconOnLeft: textOnRight);

        return Row(
          children: [
            Expanded(child: textOnRight ? iconBadge : text),
            SizedBox(width: centerSpacerWidth),
            Expanded(child: textOnRight ? text : iconBadge),
          ],
        );
      }),
    );
  }

  // Step number
  Widget _stepNumberBadge(BuildContext context,int step, bool isActive, {bool small = false}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      padding: EdgeInsets.all(small ? 8 : 10),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        shape: BoxShape.circle,
        boxShadow: isActive
            ? [
          BoxShadow(
            color: AppColors.primaryColor,
            blurRadius: 12,
          ),
        ]
            : [],
      ),
      child: Text(
        "$step",
        style: TTextTheme.h1Style(context),
      ),
    );
  }

  //  text block
  Widget _stepText(BuildContext context,int step, String title, String desc, bool isActive, bool textOnRight) {
    final CrossAxisAlignment crossAlign =
    textOnRight ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final TextAlign textAlign =
    textOnRight ? TextAlign.left : TextAlign.right;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: isActive ? 1.0 : 0.4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: crossAlign,
          children: [
            _stepNumberBadge(context,step, isActive),
            const SizedBox(height: 18),
            Text(
              title,
              textAlign: textAlign,
              style: TTextTheme.h5Style(context),
            ),
            const SizedBox(height: 15),
            Text(
              desc,
              textAlign: textAlign,
              style: TTextTheme.bodyRegular16black(context)
            ),
          ],
        ),
      ),
    );
  }

  // Icons
  Widget _stepIcon(String icon, bool isActive, {required bool iconOnLeft}) {
    final Alignment alignment =
    iconOnLeft ? Alignment.centerRight : Alignment.centerLeft;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: isActive ? 1.0 : 0.35,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Align(
          alignment: alignment,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              icon,
              color: isActive
                  ? AppColors.primaryColor
                  : AppColors.quadrantalTextColor,
            ),
          ),
        ),
      ),
    );
  }

  // Mobile content
  Widget _stepMobileContent(BuildContext context,int step, String title, String desc, String icon, bool isActive) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: isActive ? 1.0 : 0.4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _stepNumberBadge(context,step, isActive, small: true),
                const SizedBox(width: 10),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.primaryColor
                        : AppColors.backgroundOfScreenColor,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    icon,
                    color: isActive
                        ? AppColors.primaryColor
                        : AppColors.quadrantalTextColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              title,
              style: TTextTheme.h5Style(context)
            ),
            const SizedBox(height: 8),
            Text(
              desc,
              style: TTextTheme.bodyRegular16black(context)
            ),
          ],
        ),
      ),
    );
  }

  // Header
  Widget _buildHeader(BuildContext context,bool isMobile, double horizontalPadding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: isMobile
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "How it work",
            style: TTextTheme.h1StyleBlack(context)
          ),
          const SizedBox(height: 6),
          Text(
            "Browse our cars, select the one that fits your needs.",
            style: TTextTheme.medium16white(context),
          ),
          const SizedBox(height: 14),
          Text(
            "Our streamlined rental process makes it easy to choose, book, and drive.",
            style: TTextTheme.h2PrimaryStyle(context)
          ),
        ],
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  "How it work",
                  style: TTextTheme.h1StyleBlack(context),
                ),
                Text(
                  "Browse our cars, select the one that fits your needs.",
                  style: TTextTheme.medium16white(context),
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
           SizedBox(
            width: 300,
            child: Text(
              "Our streamlined rental process makes it easy to choose, book, and drive.",
              style: TTextTheme.h2PrimaryStyle(context)
            ),
          ),
        ],
      ),
    );
  }
}







