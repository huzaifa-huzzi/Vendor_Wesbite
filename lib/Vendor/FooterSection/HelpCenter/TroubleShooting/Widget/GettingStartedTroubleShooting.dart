import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/HelpCenterController.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/Reusable%20Widget/PrimaryButtonOfHelpCenter.dart';

class GettingStartedTroubleShooting extends StatelessWidget {
  const GettingStartedTroubleShooting({super.key});

  @override
  Widget build(BuildContext context) {
    final HelpCenterController controller = Get.put(HelpCenterController());

    return Obx(() {
      switch (controller.currentTroubleView.value) {
        case TroubleShootingFlowView.breakdown:
          return _buildBreakdownScreen(context, controller);
        case TroubleShootingFlowView.accident:
          return _buildAccidentScreen(context, controller);
        case TroubleShootingFlowView.lateReturn:
          return _buildLateReturnScreen(context, controller);
        case TroubleShootingFlowView.supportDashboard:
        default:
          return _buildSupportDashboard(context, controller);
      }
    });
  }

  ///  MAIN SUPPORT DASHBOARD
  Widget _buildSupportDashboard(BuildContext context, HelpCenterController controller) {
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
          Text(TextString.troubleShootingSubtitle1, style: TTextTheme.h1StyleBlack(context), textAlign: TextAlign.center),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 750),
            child: Text(
              TextString.troubleShootingSubtitle2,
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
                title:TextString.troubleShootingSubtitle3 ,
                subtitle:TextString.troubleShootingSubtitle4 ,
                onBtnTap: () => controller.switchTroubleView(TroubleShootingFlowView.breakdown),
              ),
              _buildGuideCard(
                context,
                width: halfCardWidth,
                title:TextString.troubleShootingSubtitle5 ,
                subtitle:TextString.troubleShootingSubtitle6 ,
                onBtnTap: () => controller.switchTroubleView(TroubleShootingFlowView.accident),
              ),
            ],
          ),
          const SizedBox(height: 25),

          _buildGuideCard(
            context,
            width: double.infinity,
            title:TextString.troubleShootingSubtitle7 ,
            subtitle:TextString.troubleShootingSubtitle8 ,
            onBtnTap: () => controller.switchTroubleView(TroubleShootingFlowView.lateReturn),
          ),
        ],
      ),
    );
  }

  /// VEHICLE BREAKDOWN SCREEN
  Widget _buildBreakdownScreen(BuildContext context, HelpCenterController controller) {
    final double horizontalPadding = AppSizes.horizontalPadding(context);
    final List<String> steps = [
    TextString.troubleShootingSubtitle9,
    TextString.troubleShootingSubtitle10 ,
      TextString.troubleShootingSubtitle11 ,
      TextString.troubleShootingSubtitle12

    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        children: [
          Text(TextString.troubleShootingSubtitle13, style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 10),
          Text(
            TextString.troubleShootingSubtitle14,
            style: TTextTheme.bodyRegular16black(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ...List.generate(steps.length, (index) {
            return _buildStepCard("Step ${index + 1}", steps[index], context);
          }),
          const SizedBox(height: 10),
          _buildInfoFooterCard(
            context,
            title:TextString.troubleShootingSubtitle15 ,
            desc:TextString.troubleShootingSubtitle16 ,
          ),
        ],
      ),
    );
  }
  ///  ACCIDENT SCREEN
  Widget _buildAccidentScreen(BuildContext context, HelpCenterController controller) {
    final double horizontalPadding = AppSizes.horizontalPadding(context);
    final List<String> steps = [
    TextString.troubleShootingSubtitle17,
    TextString.troubleShootingSubtitle18 ,
    TextString.troubleShootingSubtitle19,
      TextString.troubleShootingSubtitle20,
      TextString.troubleShootingSubtitle21

    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        children: [
          Text(TextString.troubleShootingSubtitle22, style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 10),
          Text(
            TextString.troubleShootingSubtitle23,
            style: TTextTheme.bodyRegular16black(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ...List.generate(steps.length, (index) {
            return _buildStepCard("Step ${index + 1}", steps[index], context);
          }),
          const SizedBox(height: 10),
          _buildInfoFooterCard(
            context,
            title:TextString.troubleShootingSubtitle24 ,
            desc:TextString.troubleShootingSubtitle25 ,
          ),
        ],
      ),
    );
  }

  /// LATE RETURN POLICY SCREEN
  Widget _buildLateReturnScreen(BuildContext context, HelpCenterController controller) {
    final double horizontalPadding = AppSizes.horizontalPadding(context);
    final List<String> steps = [
    TextString.troubleShootingSubtitle26,
      TextString.troubleShootingSubtitle27

    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        children: [
          Text(TextString.troubleShootingSubtitle28, style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 10),
          Text(
              TextString.troubleShootingSubtitle29,
            style: TTextTheme.bodyRegular16black(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ...List.generate(steps.length, (index) {
            return _buildStepCard("Step ${index + 1}", steps[index], context);
          }),
          const SizedBox(height: 10),
          _buildInfoFooterCard(
            context,
            title:TextString.troubleShootingSubtitle30 ,
            desc:TextString.troubleShootingSubtitle31,
          ),
        ],
      ),
    );
  }
       /// ---------- Extra Widget --------- ///
  // Step Card
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
                Text(leadingTitle, style: TTextTheme.h5Style(context).copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(description, style: TTextTheme.medium16black(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }

   // Footer Card
  Widget _buildInfoFooterCard(BuildContext context, {required String title, required String desc}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TTextTheme.h5Style(context).copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            desc,
            style: TTextTheme.medium16black(context).copyWith(color: Colors.black87),
          ),
        ],
      ),
    );
  }

   // Guide Card
  Widget _buildGuideCard(BuildContext context, {required double width, required String title, required String subtitle, required VoidCallback onBtnTap}) {
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