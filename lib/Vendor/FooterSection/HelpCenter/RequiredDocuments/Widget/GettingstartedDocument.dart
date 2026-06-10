import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/HelpCenterController.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/Reusable%20Widget/PrimaryButtonOfHelpCenter.dart';

class GettingStartedDocument extends StatelessWidget {
  const GettingStartedDocument({super.key});

  @override
  Widget build(BuildContext context) {
    final HelpCenterController controller = Get.put(HelpCenterController());

    return Obx(() {
      switch (controller.currentDocumentView.value) {
        case DocumentFlowView.idVerification:
          return _buildIdVerificationScreen(context, controller);
        case DocumentFlowView.internationalPermit:
          return _buildInternationalPermitScreen(context, controller);
        case DocumentFlowView.paymentMethods:
          return _buildPaymentMethodsScreen(context, controller);
        case DocumentFlowView.documentsDashboard:
        default:
          return _buildDocumentsDashboard(context, controller);
      }
    });
  }

  ///  DASHBOARD
  Widget _buildDocumentsDashboard(BuildContext context, HelpCenterController controller) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobileOrTablet = screenWidth < 900;
    final double horizontalPadding = AppSizes.horizontalPadding(context);
    final double halfCardWidth = isMobileOrTablet ? double.infinity : (screenWidth - (horizontalPadding * 2) - 25) / 2;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        children: [
          Text(TextString.requiredDocumentSubtitle1, style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 40),
          Wrap(
            spacing: 25,
            runSpacing: 25,
            children: [
              _buildGuideCard(
                context,
                width: halfCardWidth,
                title:TextString.requiredDocumentSubtitle2 ,
                subtitle:TextString.requiredDocumentSubtitle3 ,
                onBtnTap: () => controller.switchDocumentView(DocumentFlowView.idVerification),
              ),
              _buildGuideCard(
                context,
                width: halfCardWidth,
                title:TextString.requiredDocumentSubtitle4 ,
                subtitle:TextString.requiredDocumentSubtitle5 ,
                onBtnTap: () => controller.switchDocumentView(DocumentFlowView.internationalPermit),
              ),
            ],
          ),
          const SizedBox(height: 25),
          _buildGuideCard(
            context,
            width: double.infinity,
            title:TextString.requiredDocumentSubtitle6 ,
            subtitle:TextString.requiredDocumentSubtitle7 ,
            onBtnTap: () => controller.switchDocumentView(DocumentFlowView.paymentMethods),
          ),
        ],
      ),
    );
  }

  ///  ID VERIFICATION SCREEN
  Widget _buildIdVerificationScreen(BuildContext context, HelpCenterController controller) {
    final double horizontalPadding = AppSizes.horizontalPadding(context);
    final List<String> ids = [TextString.requiredDocumentSubtitle8,TextString.requiredDocumentSubtitle9 , TextString.requiredDocumentSubtitle10];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        children: [
          Text(TextString.requiredDocumentSubtitle11, style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 40),
          ...List.generate(ids.length, (index) => _buildStepCard((index + 1).toString().padLeft(2, '0'), ids[index], context)),
        ],
      ),
    );
  }

  ///  INTERNATIONAL PERMIT SCREEN
  Widget _buildInternationalPermitScreen(BuildContext context, HelpCenterController controller) {
    final double horizontalPadding = AppSizes.horizontalPadding(context);
    final List<String> steps = [TextString.requiredDocumentSubtitle12,TextString.requiredDocumentSubtitle13 ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        children: [
          Text(TextString.requiredDocumentSubtitle14, style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 40),
          ...List.generate(steps.length, (index) => _buildStepCard("Step ${index + 1}", steps[index], context)),
        ],
      ),
    );
  }

  ///  PAYMENT METHODS SCREEN
  Widget _buildPaymentMethodsScreen(BuildContext context, HelpCenterController controller) {
    final double horizontalPadding = AppSizes.horizontalPadding(context);
    final List<String> options = [
    TextString.requiredDocumentSubtitle15 ,
      TextString.requiredDocumentSubtitle16 ,
      TextString.requiredDocumentSubtitle17

    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        children: [
          Text(TextString.requiredDocumentSubtitle18, style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 40),
          ...List.generate(options.length, (index) => _buildStepCard("Option ${index + 1}", options[index], context)),
        ],
      ),
    );
  }

  //  (Cards/Steps)
  Widget _buildStepCard(String leadingTitle, String description, BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.quadrantalTextColor.withOpacity(0.12))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 4, height: 38, decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(2))),
          const SizedBox(width: 16),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(leadingTitle, style: TTextTheme.h5Style(context)), const SizedBox(height: 4), Text(description, style: TTextTheme.medium16black(context))])),
        ],
      ),
    );
  }

  Widget _buildGuideCard(BuildContext context, {required double width, required String title, required String subtitle, required VoidCallback onBtnTap}) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColors.quadrantalTextColor.withOpacity(0.5))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TTextTheme.h5Style(context).copyWith(fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 10),
          Text(subtitle, style: TTextTheme.tableRegular18(context), maxLines: 3, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 25),
          PrimaryBtnOfHelpCenter(text: "View Detail", width: 130, height: 42, borderRadius: BorderRadius.circular(8), onTap: onBtnTap),
        ],
      ),
    );
  }
}