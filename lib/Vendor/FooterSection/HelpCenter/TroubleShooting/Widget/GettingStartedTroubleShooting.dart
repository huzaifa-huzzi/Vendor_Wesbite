import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
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
          Text("Support", style: TTextTheme.h1StyleBlack(context), textAlign: TextAlign.center),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 750),
            child: Text(
              "What do you do in case of breakdown, accident, late return, or any issue during your rental",
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
                title: "What to do in break down",
                subtitle: "Step by step instruction if your vehicle breakdown",
                onBtnTap: () => controller.switchTroubleView(TroubleShootingFlowView.breakdown),
              ),
              _buildGuideCard(
                context,
                width: halfCardWidth,
                title: "What to do after accident",
                subtitle: "Critical steps to follow if you are involved in an accident",
                onBtnTap: () => controller.switchTroubleView(TroubleShootingFlowView.accident),
              ),
            ],
          ),
          const SizedBox(height: 25),

          _buildGuideCard(
            context,
            width: double.infinity,
            title: "Late return policy",
            subtitle: "What happened if your vehicle past the agreed time",
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
      "Pull over safely to the side of the road. Turn on your hazard light",
      "If safe, place the warning triangle 50 meter behind your vehicle",
      "Call our 24/7 roadside assistance hotline. +65234556666",
      "Provide your rental agreement number, vehicle plate and exact location"
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        children: [
          Text("Immediate Steps", style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 10),
          Text(
            "Our pricing is depend on vehicle class, rental duration, and selected insurance coverage",
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
            title: "What happened next",
            desc: "Our team will dispatch roadside assistance. Depending on the issue, we'll either repair the vehicle on-site or arrange a replacement vehicle at the nearest office",
          ),
        ],
      ),
    );
  }
  ///  ACCIDENT SCREEN
  Widget _buildAccidentScreen(BuildContext context, HelpCenterController controller) {
    final double horizontalPadding = AppSizes.horizontalPadding(context);
    final List<String> steps = [
      "Ensure everyone's safety. Call emergency services (112 / 911) if there are injuries.",
      "Do not admit fault or sign any documents at the scene.",
      "Exchange information with the other party (name, phone, insurance, plate number).",
      "Take photos of all vehicles involved, damage, and the surrounding area.",
      "Call our support line within 24 hours to report the incident and begin the claims process."
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        children: [
          Text("At the scene", style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 10),
          Text(
            "Critical steps to follow if you are involved in an accident",
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
            title: "Tips",
            desc: "File a police report if required by local law — we'll need the report number for insurance processing.",
          ),
        ],
      ),
    );
  }

  /// LATE RETURN POLICY SCREEN
  Widget _buildLateReturnScreen(BuildContext context, HelpCenterController controller) {
    final double horizontalPadding = AppSizes.horizontalPadding(context);
    final List<String> steps = [
      "Returns 30 minutes to 3 hours late are charged a half-day rate.",
      "Returns more than 3 hours late are charged a full additional day."
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        children: [
          Text("Grace Period", style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 10),
          Text(
            "We offer a 29-minute grace period after your scheduled return time. Returns within this window incur no extra charges",
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
            title: "Tips",
            desc: "If you know you'll be late, call us in advance — we can often extend your rental at the standard daily rate.",
          ),
        ],
      ),
    );
  }
       /// ---------- Extra Widget --------- ///
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