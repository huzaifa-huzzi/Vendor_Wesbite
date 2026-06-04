import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/HelpCenterController.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/Reusable%20Widget/PrimaryButtonOfHelpCenter.dart';


class GettingStartedWidget extends StatelessWidget {
  const GettingStartedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HelpCenterController controller = Get.put(HelpCenterController());

    return Obx(() {
      switch (controller.currentView.value) {
        case GettingStartedView.firstRentalGuide:
          return _buildFirstRentalGuideScreen(context, controller);
        case GettingStartedView.requiredDocuments:
          return _buildRequiredDocumentsScreen(context, controller);
        case GettingStartedView.bookingTips:
          return _buildBookingTipsScreen(context, controller);
        case GettingStartedView.mainDashboard:
        default:
          return _buildMainDashboard(context, controller);
      }
    });
  }

  /// MAIN DASHBOARD VIEW

  Widget _buildMainDashboard(BuildContext context, HelpCenterController controller) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobileOrTablet = screenWidth < 900;
    final bool isTiny = screenWidth <= 320;
    final double horizontalPadding = AppSizes.horizontalPadding(context);

    final double cardWidth = isMobileOrTablet
        ? double.infinity
        : (screenWidth - (horizontalPadding * 2) - 25) / 2;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Getting Started",
            style: TTextTheme.h1StyleBlack(context).copyWith(
              fontSize: isTiny ? 24 : (isMobileOrTablet ? 30 : 36),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Text(
              "Step by step guides for first rental - documents required, age limits and booking tips",
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
                width: cardWidth,
                title: "Your First Rental Complete Guide",
                subtitle: "Everything you need to know before renting for the first time",
                onBtnTap: () => controller.switchView(GettingStartedView.firstRentalGuide),
              ),
              _buildGuideCard(
                context,
                width: cardWidth,
                title: "What Documents do you need?",
                subtitle: "A checklist of all required documents for renting a vehicle",
                onBtnTap: () => controller.switchView(GettingStartedView.requiredDocuments),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.quadrantalTextColor.withOpacity(0.08)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.error_outline, color: AppColors.primaryColor, size: 20),
                    const SizedBox(width: 8),
                    Text("Tips for Smooth Booking", style: TTextTheme.h5Style(context)),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  "Pro tips to get the best rates and a hassle-free experience",
                  style: TTextTheme.tableRegular18(context),
                ),
                const SizedBox(height: 20),
                PrimaryBtnOfHelpCenter(
                  text: "View Detail",
                  width: 130,
                  height: 42,
                  borderRadius: BorderRadius.circular(8),
                  onTap: () => controller.switchView(GettingStartedView.bookingTips),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///  FIRST RENTAL COMPLETE GUIDE SCREEN
  Widget _buildFirstRentalGuideScreen(BuildContext context, HelpCenterController controller) {
    final double horizontalPadding = AppSizes.horizontalPadding(context);

    final List<Map<String, dynamic>> workflowData = [
      {"section": "Before you Arrive", "desc": "Renting a car first time can feel overwhelming but we made the process as simple as possible", "steps": ["Ensure you have a valid driver's license (held for at least 1 year) and a government-issued ID or passport.", "Have a credit or debit card in the primary driver's name ready for the security deposit.", "Check our office hours and visit during operating times. No appointment needed - walk ins are welcome."]},
      {"section": "At the office", "desc": "Complete verification, select your vehicle, and finalize the rental process with our team.", "steps": ["Present your documents at the counter. Our team will verify your identity and driving eligibility.", "Choose your vehicle class and review the rental agreement, including insurance options.", "Complete the vehicle inspection with our staff, noting any pre-existing marks on the checklist."]},
      {"section": "On the Road", "desc": "Stay covered with your selected insurance and keep essential documents accessible throughout your journey.", "steps": ["Once you're on the road, stay covered under your selected insurance plan and keep rental agreement and emergency contact details accessible at all times."]}
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        children: [
          ...workflowData.map((data) {
            int currentStepIndex = workflowData.indexOf(data);
            int baseStepNumber = currentStepIndex == 0 ? 1 : (currentStepIndex == 1 ? 4 : 7);

            return Column(
              children: [
                Text(data["section"], style: TTextTheme.h1StyleBlack(context), textAlign: TextAlign.center),
                const SizedBox(height: 10),
                Text(data["desc"], style: TTextTheme.bodyRegular16black(context), textAlign: TextAlign.center),
                const SizedBox(height: 30),
                ...List.generate(data["steps"].length, (idx) {
                  return _buildStepCard("Step ${baseStepNumber + idx}", data["steps"][idx],context);
                }),
                const SizedBox(height: 40),
              ],
            );
          }),
        ],
      ),
    );
  }

  ///  REQUIRED DOCUMENTS
  Widget _buildRequiredDocumentsScreen(BuildContext context, HelpCenterController controller) {
    final double horizontalPadding = AppSizes.horizontalPadding(context);

    final Map<String, List<String>> documentsData = {
      "Local": [
        "Submit valid driving license (minimum 1 holding year)",
        "Submit government issue ID",
        "Submit credit or debit card in driver's name."
      ],
      "International": [
        "Submit International Documents",
        "Submit government issue ID",
        "Submit credit or debit card in driver's name."
      ]
    };

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Text("Primary Documents", style: TTextTheme.h1StyleBlack(context)),
                const SizedBox(height: 10),
                Text(
                    "Provide valid identification and required documents to complete verification and proceed with your rental.",
                    style: TTextTheme.bodyRegular16black(context),
                    textAlign: TextAlign.center
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.signaturePadColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.quadrantalTextColor.withOpacity(0.15)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: ["Local", "International"].map((tabName) {
                return Obx(() {
                  bool isSelected = controller.activeDocumentTab.value == tabName;
                  return GestureDetector(
                    onTap: () => controller.switchDocumentTab(tabName),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primaryColor : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "$tabName People",
                        style: isSelected ? TTextTheme.medium14White(context) :TTextTheme.tableRegular14(context)
                      ),
                    ),
                  );
                });
              }).toList(),
            ),
          ),
          const SizedBox(height: 30),
          Obx(() {
            var activeTab = controller.activeDocumentTab.value;
            return Column(
              children: List.generate(documentsData[activeTab]!.length, (index) {
                return _buildStepCard("Step ${index + 1}", documentsData[activeTab]![index],context);
              }),
            );
          }),
        ],
      ),
    );
  }


  // BOOKING TIPS SCREEN
  Widget _buildBookingTipsScreen(BuildContext context, HelpCenterController controller) {
    final double horizontalPadding = AppSizes.horizontalPadding(context);
    final List<String> tips = [
      "Book at least 48 hours in advance for best daily rates",
      "Weekly rental offers up to 25% saving compared to daily bookings",
      "Check for seasonal promotions on our website or ask at the counter"
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        children: [
          Text("Getting Best Rates", style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 10),
          Text("Find competitive pricing with transparent rates and no hidden charges.", style: TTextTheme.bodyRegular16black(context), textAlign: TextAlign.center),
          const SizedBox(height: 40),
          ...List.generate(tips.length, (index) {
            return _buildStepCard("Tip no ${index + 1}", tips[index],context);
          }),
        ],
      ),
    );
  }
  // REUSABLE HELPER UI BLOCKS WIDGETS

  Widget _buildStepCard(String leadingTitle, String description,BuildContext context) {
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
          Text(title, style: TTextTheme.h5Style(context).copyWith(fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 10),
          Text(subtitle, style: TTextTheme.tableRegular18(context), maxLines: 3, overflow: TextOverflow.ellipsis),
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