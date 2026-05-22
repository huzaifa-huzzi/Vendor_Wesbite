import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/Services/ServicesController.dart';

class TyreBanner extends StatelessWidget {
  const TyreBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double bannerHeight = screenWidth < 600 ? 190 : 230;
    final controller = Get.find<ServicesController>();

    return Obx(() {
      final tyreService = controller.selectedTyreService.value;

      final String title = tyreService != null ? TextString.tyreBannerTitle : TextString.ServicesCarTitle;

      final String bgImage = tyreService != null
          ? ImageString.tyreBackground
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
                          Text(TextString.servicestitle, style: TTextTheme.bodyRegular16white(context)),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                if (tyreService != null) {
                                  controller.resetTyreService();
                                } else {
                                  Get.back();
                                }
                              },
                              child: Text(
                                TextString.servicesTypes,
                                style: TTextTheme.bodyRegular16white(context).copyWith(
                                  decoration: tyreService != null ? TextDecoration.underline : TextDecoration.none,
                                  fontWeight: tyreService == null ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                          if (tyreService != null) ...[
                            Text(" / ", style: TTextTheme.bodyRegular16white(context)),
                            Text(
                              TextString.tyreServiceDetail,
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