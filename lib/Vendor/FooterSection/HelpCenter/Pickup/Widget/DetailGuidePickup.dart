import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/HelpCenterController.dart';

class DetailLogisticsGuide extends StatelessWidget {
  const DetailLogisticsGuide({super.key});

  @override
  Widget build(BuildContext context) {
    final HelpCenterController controller = Get.put(HelpCenterController());
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 700;

    return Obx(() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: isMobile ? 40 : 65),
        constraints: BoxConstraints(minHeight: isMobile ? 180 : 320),
        decoration: BoxDecoration(
          color: AppColors.textColor,
          image: DecorationImage(
            image: AssetImage(controller.dynamicLogisticsBackgroundImage),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.55), BlendMode.srcOver),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  controller.dynamicLogisticsTitle2,
                  style: TTextTheme.h6Style(context).copyWith(
                    color: Colors.white,
                    fontSize: screenWidth < 400 ? 22 : (isMobile ? 26 : 38),
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 4,
                runSpacing: 4,
                children: [
                  _buildBreadcrumbItem(
                    context,
                    label: "Home",
                    onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),
                  ),
                  _buildSeparator(context),
                  _buildBreadcrumbItem(
                    context,
                    label: TextString.helpCenterTitle,
                    onTap: () {
                      controller.resetToDashboard();
                      controller.resetLogisticsToDashboard();
                    },
                  ),
                  _buildSeparator(context),
                  _buildBreadcrumbItem(
                    context,
                    label:TextString.pickupTitle ,
                    onTap: controller.isLogisticsSubViewDetail
                        ? () => controller.resetLogisticsToDashboard()
                        : null,
                  ),
                  if (controller.isLogisticsSubViewDetail) ...[
                    _buildSeparator(context),
                    _buildBreadcrumbItem(context, label:TextString.pickupSubtitle , onTap: null),
                  ],
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

   /// ------- Extra Widget ------ ///

  Widget _buildBreadcrumbItem(BuildContext context, {required String label, required VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.transparent,
      child: Text(label, style: TTextTheme.bodyRegular16(context).copyWith(color: AppColors.whiteColor)),
    );
  }

  Widget _buildSeparator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text("/", style: TTextTheme.bodyRegular16(context).copyWith(color: AppColors.whiteColor)),
    );
  }
}