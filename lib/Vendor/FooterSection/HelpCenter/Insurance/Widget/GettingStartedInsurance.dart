import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/HelpCenterController.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/Reusable%20Widget/PrimaryButtonOfHelpCenter.dart';

class GettingStartedInsurance extends StatelessWidget {
  const GettingStartedInsurance({super.key});

  @override
  Widget build(BuildContext context) {
    final HelpCenterController controller = Get.put(HelpCenterController());

    return Obx(() {
      switch (controller.currentInsuranceView.value) {
        case InsuranceFlowView.coverageOptions:
          return _buildCoverageOptionsScreen(context);
        case InsuranceFlowView.reportDamage:
          return _buildReportDamageScreen(context);
        case InsuranceFlowView.personalInsurance:
          return _buildPersonalInsuranceScreen(context);
        case InsuranceFlowView.insuranceDashboard:
        default:
          return _buildInsuranceDashboard(context, controller);
      }
    });
  }

  ///  MAIN INSURANCE DASHBOARD
  Widget _buildInsuranceDashboard(BuildContext context, HelpCenterController controller) {
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
          Text(TextString.InsuranceGuide, style: TTextTheme.h1StyleBlack(context), textAlign: TextAlign.center),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: Text(
              TextString.InsuranceGuide1,
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
                title:TextString.InsuranceGuide2 ,
                subtitle:TextString.InsuranceGuide3 ,
                onBtnTap: () => controller.switchInsuranceView(InsuranceFlowView.coverageOptions),
              ),
              _buildGuideCard(
                context,
                width: halfCardWidth,
                title:TextString.InsuranceGuide4 ,
                subtitle:TextString.InsuranceGuide5 ,
                onBtnTap: () => controller.switchInsuranceView(InsuranceFlowView.reportDamage),
              ),
            ],
          ),
          const SizedBox(height: 25),

          _buildGuideCard(
            context,
            width: double.infinity,
            title:TextString.InsuranceGuide6 ,
            subtitle:TextString.InsuranceGuide7 ,
            onBtnTap: () => controller.switchInsuranceView(InsuranceFlowView.personalInsurance),
          ),
        ],
      ),
    );
  }

  /// COVERAGE TIERS SCREEN
  Widget _buildCoverageOptionsScreen(BuildContext context) {
    final double horizontalPadding = AppSizes.horizontalPadding(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(TextString.InsuranceGuide8, style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 10),
          Text(TextString.InsuranceGuide9, style: TTextTheme.bodyRegular16black(context)),
          const SizedBox(height: 35),

          _buildStepCard("Step 1",TextString.InsuranceGuide10 , context),
          _buildStepCard("Step 2",TextString.InsuranceGuide11, context),
          _buildStepCard("Step 3",TextString.InsuranceGuide12 , context),

          const SizedBox(height: 15),
          _buildInfoFooterCard(
            context,
            title:TextString.InsuranceGuide13 ,
            desc:TextString.InsuranceGuide14 ,
          ),
        ],
      ),
    );
  }


  /// NEW DAMAGE DURING RENTAL SCREEN
  Widget _buildReportDamageScreen(BuildContext context) {
    final double horizontalPadding = AppSizes.horizontalPadding(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(TextString.InsuranceGuide15, style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 10),
          Text(TextString.InsuranceGuide16, style: TTextTheme.bodyRegular16black(context)),
          const SizedBox(height: 35),

          _buildStepCard("Step 1",TextString.InsuranceGuide17 , context),
          _buildStepCard("Step 2",TextString.InsuranceGuide18 , context),
          _buildStepCard("Step 3",TextString.InsuranceGuide19 , context),
        ],
      ),
    );
  }

  ///  PERSONAL AUTO & CREDIT CARD INSURANCE SCREEN
  Widget _buildPersonalInsuranceScreen(BuildContext context) {
    final double horizontalPadding = AppSizes.horizontalPadding(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text(TextString.InsuranceGuide20, style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 10),
          Text(TextString.InsuranceGuide21, style: TTextTheme.bodyRegular16black(context)),
          const SizedBox(height: 35),
          _buildNumberedCard("01",TextString.InsuranceGuide22, context),

          const SizedBox(height: 45),

          Text(TextString.InsuranceGuide23, style: TTextTheme.h1StyleBlack(context)),
          const SizedBox(height: 10),
          Text(TextString.InsuranceGuide24, style: TTextTheme.bodyRegular16black(context)),
          const SizedBox(height: 35),
          _buildNumberedCard("01",TextString.InsuranceGuide25 , context),
        ],
      ),
    );
  }

   /// ---------- Extra Widget ------------ ///


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

  Widget _buildNumberedCard(String number, String description, BuildContext context) {
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
                Text(number, style: TTextTheme.h5Style(context).copyWith(fontWeight: FontWeight.bold, color: Colors.black)),
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
        color: const Color(0xFFF2F7FA),
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
