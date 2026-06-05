import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
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
          Text("Logistics", style: TTextTheme.h1StyleBlack(context), textAlign: TextAlign.center),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 750),
            child: Text(
              "Office locations, hours, inspection process, after-hours drop-off, and key return procedures.",
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
                title: "Vehicle Pick up process",
                subtitle: "Step by step instruction if your vehicle breakdown", // content matched to asset image_a62e9c.png
                onBtnTap: () => controller.switchLogisticsView(LogisticsFlowView.pickupProcess),
              ),
              _buildGuideCard(
                context,
                width: halfCardWidth,
                title: "Vehicle Return Checklist",
                subtitle: "Steps to ensure a smooth return and avoid extra charges.",
                onBtnTap: () => controller.switchLogisticsView(LogisticsFlowView.returnChecklist),
              ),
            ],
          ),
          const SizedBox(height: 25),

          _buildGuideCard(
            context,
            width: double.infinity,
            title: "After Hour Key Drop off",
            subtitle: "How to return your vehicle outside of office hour",
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
          Text("At the counter", style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 10),
          Text("Step by step instruction if your vehicle breakdown", style: TTextTheme.bodyRegular16black(context)),
          const SizedBox(height: 35),
          _buildStepCard("Step 1", "Present your booking confirmation, ID, and driver's license.", context),
          _buildStepCard("Step 2", "Review and sign the rental agreement.", context),
          _buildStepCard("Step 3", "Select or confirm your insurance coverage.", context),

          const SizedBox(height: 45),

          Text("Vehicle Inspection", style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 10),
          Text("Step by step instruction if your vehicle breakdown", style: TTextTheme.bodyRegular16black(context)),
          const SizedBox(height: 35),
          _buildStepCard("Step 1", "Walk around the vehicle with our staff and note any pre-existing damage on the checklist", context),
          _buildStepCard("Step 2", "Verify fuel level, mileage reading, and included accessories.", context),

          const SizedBox(height: 15),
          _buildInfoFooterCard(
            context,
            title: "Tip",
            desc: "Take your own photos or video of the vehicle before leaving — it takes 2 minutes and can save you disputes later.",
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
          Text("Before Returning", style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 10),
          Text("Steps to ensure a smooth return and avoid extra charges.", style: TTextTheme.bodyRegular16black(context)),
          const SizedBox(height: 35),
          _buildStepCard("Step 1", "Refuel the vehicle to the same level as pick-up (full tank).", context),
          _buildStepCard("Step 2", "Remove all personal belongings from the vehicle.", context),
          _buildStepCard("Step 3", "Check for any new damage and photograph it.", context),

          const SizedBox(height: 45),
          Text("At the office", style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 10),
          Text("Steps to ensure a smooth return and avoid extra charges.", style: TTextTheme.bodyRegular16black(context)),
          const SizedBox(height: 35),
          _buildStepCard("Step 1", "Park in the designated return area.", context),
          _buildStepCard("Step 2", "Return the keys to the counter and wait for the final inspection.", context),

          const SizedBox(height: 15),
          _buildInfoFooterCard(
            context,
            title: "Tip",
            desc: "Final invoices are typically emailed within 24 hours of return.",
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
          Text("Key Drop Procedure", style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              "If you need to return the vehicle when the office is closed, use our key drop box located at the office entrance.",
              style: TTextTheme.bodyRegular16black(context),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          _buildStepCard("Step 1", "Park the vehicle in the designated return area and lock it.", context),
          _buildStepCard("Step 2", "Place the key in the provided envelope along with your rental agreement number.", context),
          _buildStepCard("Step 3", "Drop the envelope in the secure key box.", context),
          const SizedBox(height: 15),
          _buildInfoFooterCard(
            context,
            title: "Tip",
            desc: "Take a photo of the parked vehicle and the key drop confirmation. The final inspection will be completed the next business day.",
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
