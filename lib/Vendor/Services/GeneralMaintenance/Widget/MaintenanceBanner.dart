import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Vendor/Services/ServicesController.dart';

class MaintenanceBanner extends StatelessWidget {
  const MaintenanceBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double bannerHeight = screenWidth < 600 ? 190 : 230;
    final controller = Get.find<ServicesController>();

    return Obx(() {
      final service = controller.selectedService.value;

      final String title = service != null ? "General Maintenance" : TextString.ServicesCarTitle;
      final String breadcrumb = service != null
          ? "Home / Services / Services Types / Service Detail"
          : "Home / Services / Services Types";
      final String bgImage = service != null
          ? ImageString.keyBenefitPic
          : ImageString.generalBackground;

      return Container(
        width: double.infinity,
        height: bannerHeight,
        margin: EdgeInsets.symmetric(
          horizontal: AppSizes.horizontalPadding(context),
          vertical: 20,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  bgImage,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth < 600 ? 25 : 50,
                    right: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TTextTheme.h1Style(context),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        breadcrumb,
                        style: TTextTheme.bodyRegular16white(context),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}