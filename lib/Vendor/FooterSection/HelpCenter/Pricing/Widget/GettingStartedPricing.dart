import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/HelpCenterController.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/Reusable%20Widget/PrimaryButtonOfHelpCenter.dart';

class GettingStartedPricing extends StatelessWidget {
  const GettingStartedPricing({super.key});

  @override
  Widget build(BuildContext context) {
    final HelpCenterController controller = Get.put(HelpCenterController());

    return Obx(() {
      switch (controller.currentPricingView.value) {
        case PricingFlowView.howPricingWorks:
          return _buildHowPricingWorksScreen(context, controller);
        case PricingFlowView.fuelPolicy:
          return _buildFuelPolicyScreen(context, controller);
        case PricingFlowView.tollCharges:
          return _buildTollChargesScreen(context, controller);
        case PricingFlowView.pricingDashboard:
        default:
          return _buildPricingDashboard(context, controller);
      }
    });
  }

  // MAIN PRICING DASHBOARD
  Widget _buildPricingDashboard(BuildContext context, HelpCenterController controller) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobileOrTablet = screenWidth < 900;
    final double horizontalPadding = AppSizes.horizontalPadding(context);

    final double halfCardWidth = isMobileOrTablet
        ? double.infinity
        : (screenWidth - (horizontalPadding * 2) - 25) / 2;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(TextString.pricingSubtitle1, style: TTextTheme.h1StyleBlack(context), textAlign: TextAlign.center),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Text(
              TextString.pricingSubtitle2 ,
              style: TTextTheme.bodyRegular16black(context),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 25,
            runSpacing: 25,
            children: [
              _buildGuideCard(
                context,
                width: halfCardWidth,
                title:TextString.pricingSubtitle3 ,
                subtitle:TextString.pricingSubtitle4 ,
                onBtnTap: () => controller.switchPricingView(PricingFlowView.howPricingWorks),
              ),
              _buildGuideCard(
                context,
                width: halfCardWidth,
                title:TextString.pricingSubtitle5 ,
                subtitle:TextString.pricingSubtitle6 ,
                onBtnTap: () => controller.switchPricingView(PricingFlowView.fuelPolicy),
              ),
            ],
          ),
          const SizedBox(height: 25),
          _buildGuideCard(
            context,
            width: double.infinity,
            title:TextString.pricingSubtitle7 ,
            subtitle:TextString.pricingSubtitle8,
            onBtnTap: () => controller.switchPricingView(PricingFlowView.tollCharges),
          ),
        ],
      ),
    );
  }


  // RATE STRUCTURE SCREEN
  Widget _buildHowPricingWorksScreen(BuildContext context, HelpCenterController controller) {
    final double horizontalPadding = AppSizes.horizontalPadding(context);
    final List<String> rules = [
    TextString.pricingSubtitle9 ,
      TextString.pricingSubtitle10 ,
      TextString.pricingSubtitle11

    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        children: [
          Text(TextString.pricingSubtitle12, style: TTextTheme.h1StyleBlack(context), textAlign: TextAlign.center),
          const SizedBox(height: 10),
          Text(
            TextString.pricingSubtitle13,
            style: TTextTheme.bodyRegular16black(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ...List.generate(rules.length, (index) {
            return _buildStepCard((index + 1).toString().padLeft(2, '0'), rules[index], context);
          }),
        ],
      ),
    );
  }

  // FUEL POLICY SCREEN
  Widget _buildFuelPolicyScreen(BuildContext context, HelpCenterController controller) {
    final double horizontalPadding = AppSizes.horizontalPadding(context);
    final List<String> guidelines = [
    TextString.pricingSubtitle14,
    TextString.pricingSubtitle15 ,
      TextString.pricingSubtitle16,

    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        children: [
          Text(TextString.pricingSubtitle17, style: TTextTheme.h1StyleBlack(context), textAlign: TextAlign.center),
          const SizedBox(height: 10),
          Text(
              TextString.pricingSubtitle18 ,
            style: TTextTheme.bodyRegular16black(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ...List.generate(guidelines.length, (index) {
            return _buildStepCard((index + 1).toString().padLeft(2, '0'), guidelines[index], context);
          }),
        ],
      ),
    );
  }

  // TOLL CHARGES SCREEN
  Widget _buildTollChargesScreen(BuildContext context, HelpCenterController controller) {
    final double horizontalPadding = AppSizes.horizontalPadding(context);
    final List<String> tolls = [
      TextString.pricingSubtitle19 ,
      TextString.pricingSubtitle20

    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        children: [
          Text(TextString.pricingSubtitle21, style: TTextTheme.h1StyleBlack(context), textAlign: TextAlign.center),
          const SizedBox(height: 10),
          Text(
            TextString.pricingSubtitle22 ,
            style: TTextTheme.bodyRegular16black(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ...List.generate(tolls.length, (index) {
            return _buildStepCard((index + 1).toString().padLeft(2, '0'), tolls[index], context);
          }),
        ],
      ),
    );
  }

   /// --------- Extra Widget ----------- ///
  // REUSABLE SUB-COMPONENTS
  Widget _buildStepCard(String leadingTitle, String description, BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.quadrantalTextColor.withOpacity(0.12)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 4,
            height: 38,
            decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(2)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(leadingTitle, style: TTextTheme.h5Style(context)),
                const SizedBox(height: 4),
                Text(description, style: TTextTheme.medium16black(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }

   // Guide Card
  Widget _buildGuideCard(
      BuildContext context, {
        required double width,
        required String title,
        required String subtitle,
        required VoidCallback onBtnTap,
      }) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.quadrantalTextColor.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TTextTheme.h5Style(context).copyWith(fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: TTextTheme.tableRegular18(context),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 25),
          PrimaryBtnOfHelpCenter(
            text: "View Detail",
            width: 130,
            height: 42,
            borderRadius: BorderRadius.circular(8),
            onTap: onBtnTap,
          ),
        ],
      ),
    );
  }
}
