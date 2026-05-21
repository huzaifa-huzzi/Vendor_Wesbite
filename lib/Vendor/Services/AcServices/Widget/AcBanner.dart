import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/Services/ServicesController.dart';

class AcBanner extends StatelessWidget {
  const AcBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double bannerHeight = screenWidth < 600 ? 190 : 230;
    final controller = Get.find<ServicesController>();

    return Obx(() {
      final acService = controller.selectedAcService.value;
      final String title = acService != null ? "Ac and Heating Services" : TextString.ServicesCarTitle;
      final String bgImage = acService != null
          ? ImageString.acBackground
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
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text("Home / Services / ", style: TTextTheme.bodyRegular16white(context)),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                if (acService != null) {
                                  controller.resetAcService();
                                } else {
                                  Get.back();
                                }
                              },
                              child: Text(
                                "Services Types",
                                style: TTextTheme.bodyRegular16white(context).copyWith(
                                  decoration: acService != null ? TextDecoration.underline : TextDecoration.none,
                                  fontWeight: acService == null ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                          if (acService != null) ...[
                            Text(" / ", style: TTextTheme.bodyRegular16white(context)),
                            Text(
                              "Service Detail",
                              style: TTextTheme.bodyRegular16white(context).copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ],
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