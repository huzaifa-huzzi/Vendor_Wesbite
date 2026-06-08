import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/HelpCenterController.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/Reusable%20Widget/PrimaryButtonOfHelpCenter.dart';

class GettingStartedPickup extends StatefulWidget {
  const GettingStartedPickup({super.key});

  @override
  State<GettingStartedPickup> createState() => _GettingStartedPickupState();
}

class _GettingStartedPickupState extends State<GettingStartedPickup> {
  final HelpCenterController controller = Get.put(HelpCenterController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.currentLogisticsView.value) {
        case LogisticsFlowView.pickupProcess:
          return _buildPickupProcessScreen(context);
        case LogisticsFlowView.returnChecklist:
          return _buildReturnChecklistScreen(context);
        case LogisticsFlowView.keyDropOff:
          return _buildKeyDropOffScreen(context);
        case LogisticsFlowView.logisticsDashboard:
        default:
          return _buildLogisticsDashboard(context);
      }
    });
  }


  ///  MAIN LOGISTICS DASHBOARD
  Widget _buildLogisticsDashboard(BuildContext context) {
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
          Text(TextString.pickupSubtitle1, style: TTextTheme.h1StyleBlack(context), textAlign: TextAlign.center),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 750),
            child: Text(
              TextString.pickupSubtitle2,
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
                title:TextString.pickupSubtitle3 ,
                subtitle:TextString.pickupSubtitle4 ,
                onBtnTap: () => controller.switchLogisticsView(LogisticsFlowView.pickupProcess),
              ),
              _buildGuideCard(
                context,
                width: halfCardWidth,
                title:TextString.pickupSubtitle5 ,
                subtitle:TextString.pickupSubtitle6 ,
                onBtnTap: () => controller.switchLogisticsView(LogisticsFlowView.returnChecklist),
              ),
            ],
          ),
          const SizedBox(height: 25),

          _buildGuideCard(
            context,
            width: double.infinity,
            title:TextString.pickupSubtitle7 ,
            subtitle:TextString.pickupSubtitle8 ,
            onBtnTap: () => controller.switchLogisticsView(LogisticsFlowView.keyDropOff),
          ),
        ],
      ),
    );
  }


  ///  VEHICLE PICK UP PROCESS SCREEN
  Widget _buildPickupProcessScreen(BuildContext context) {
    final double horizontalPadding = AppSizes.horizontalPadding(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(TextString.pickupSubtitle9, style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 10),
          Text(TextString.pickupSubtitle10, style: TTextTheme.bodyRegular16black(context)),
          const SizedBox(height: 35),
          _buildStepCard("Step 1",TextString.pickupSubtitle11 , context),
          _buildStepCard("Step 2",TextString.pickupSubtitle12, context),
          _buildStepCard("Step 3",TextString.pickupSubtitle13 , context),

          const SizedBox(height: 45),

          Text(TextString.pickupSubtitle14, style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 10),
          Text(TextString.pickupSubtitle15, style: TTextTheme.bodyRegular16black(context)),
          const SizedBox(height: 35),
          _buildStepCard("Step 1",TextString.pickupSubtitle16, context),
          _buildStepCard("Step 2",TextString.pickupSubtitle17 , context),

          const SizedBox(height: 15),
          _buildInfoFooterCard(
            context,
            title:TextString.pickupSubtitle18 ,
            desc:TextString.pickupSubtitle19 ,
          ),
        ],
      ),
    );
  }
  ///  VEHICLE RETURN CHECKLIST SCREEN
  Widget _buildReturnChecklistScreen(BuildContext context) {
    final double horizontalPadding = AppSizes.horizontalPadding(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(TextString.pickupSubtitle20, style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 10),
          Text(TextString.pickupSubtitle21, style: TTextTheme.bodyRegular16black(context)),
          const SizedBox(height: 35),
          _buildStepCard("Step 1",TextString.pickupSubtitle22 , context),
          _buildStepCard("Step 2",TextString.pickupSubtitle23 , context),
          _buildStepCard("Step 3",TextString.pickupSubtitle24 , context),

          const SizedBox(height: 45),
          Text(TextString.pickupSubtitle25, style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 10),
          Text(TextString.pickupSubtitle26, style: TTextTheme.bodyRegular16black(context)),
          const SizedBox(height: 35),
          _buildStepCard("Step 1",TextString.pickupSubtitle27 , context),
          _buildStepCard("Step 2",TextString.pickupSubtitle28 , context),

          const SizedBox(height: 15),
          _buildInfoFooterCard(
            context,
            title:TextString.pickupSubtitle29 ,
            desc:TextString.pickupSubtitle30,
          ),
        ],
      ),
    );
  }


  /// AFTER HOUR KEY DROP OFF SCREEN
  Widget _buildKeyDropOffScreen(BuildContext context) {
    final double horizontalPadding = AppSizes.horizontalPadding(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(TextString.pickupSubtitle31, style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              TextString.pickupSubtitle32,
              style: TTextTheme.bodyRegular16black(context),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          _buildStepCard("Step 1",TextString.pickupSubtitle33 , context),
          _buildStepCard("Step 2",TextString.pickupSubtitle34 , context),
          _buildStepCard("Step 3",TextString.pickupSubtitle35, context),
          const SizedBox(height: 15),
          _buildInfoFooterCard(
            context,
            title:TextString.pickupSubtitle36 ,
            desc:TextString.pickupSubtitle37 ,
          ),
        ],
      ),
    );
  }
    /// ------------- Extra Widget --------- ///
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
