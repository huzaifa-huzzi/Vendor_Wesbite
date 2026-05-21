import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/Services/ServicesController.dart';


class TyreKeyBenefitsSection extends StatelessWidget {
  const TyreKeyBenefitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobileOrTablet = screenWidth < 950;
    final bool isTiny = screenWidth <= 300;
    final controller = Get.find<ServicesController>();

    return Obx(() {
      final selectedTyre = controller.selectedTyreService.value;
      final String? serviceTitle = selectedTyre?["title"];

      List<Map<String, String>> currentBenefits;
      String currentImage;
      if (serviceTitle == "Tyre Alignment") {
        currentImage = ImageString.tyreAlignment1;
        currentBenefits = [
          {"title": "Enhanced Driving Stability", "subtitle": "Improves control and balance on all road conditions."},
          {"title": "Improved Safety", "subtitle": "Ensures proper grip, traction, and braking performance."},
          {"title": "Smoother Ride Quality", "subtitle": "Minimizes vibrations and enhances driving comfort."},
          {"title": "Cost Savings", "subtitle": "Prevents premature tyre wear and expensive replacements."},
        ];
      } else if (serviceTitle == "Tyre Balancing") {
        currentImage = ImageString.tyreBalancing1;
        currentBenefits = [
          {"title": "Smooth Ride", "subtitle": "Eliminates vibrations for comfortable driving."},
          {"title": "Even Tire Wear", "subtitle": "Helps tires last longer by preventing uneven wear."},
          {"title": "Improved Handling", "subtitle": "Enhances steering control and stability."},
          {"title": "Increases Safety", "subtitle": "Reduces the risk of wobbling or loss of control."},
        ];
      } else if (serviceTitle == "Tyre Rotation") {
        currentImage = ImageString.tyreRotation1;
        currentBenefits = [
          {"title": "Extends Tyre Life", "subtitle": "Promotes even wear for longer-lasting tyres."},
          {"title": "Improves Traction", "subtitle": "Ensures better grip on the road."},
          {"title": "Enhances Handling", "subtitle": "Keeps driving smooth and stable."},
          {"title": "Increases Safety", "subtitle": "Reduces risk of uneven wear-related issues."},
        ];
      } else if (serviceTitle == "Tyre Replacement") {
        currentImage = ImageString.tyreReplacemant1;
        currentBenefits = [
          {"title": "Improves Road Grip", "subtitle": "Ensures better traction in all driving conditions."},
          {"title": "Enhances Safety", "subtitle": "Reduces the risk of skidding and accidents."},
          {"title": "Boosts Handling", "subtitle": "Provides better control and stability."},
          {"title": "Increases Comfort", "subtitle": "Delivers a smoother and quieter ride."},
        ];
      } else if (serviceTitle == "Puncture Repair") {
        currentImage = ImageString.puncture1;
        currentBenefits = [
          {"title": "Restores Tire Integrity", "subtitle": "Repairs damage to keep your tire strong and reliable."},
          {"title": "Ensures Safety", "subtitle": "Reduces the risk of skidding and accidents."},
          {"title": "Saves Cost", "subtitle": "Avoids the need for full tyre replacement."},
          {"title": "Maintains Performance", "subtitle": "Keeps handling and ride quality consistent."},
        ];
      } else if (serviceTitle == "Rim Repair") {
        currentImage = ImageString.rimRepair1;
        currentBenefits = [
          {"title": "Restores Wheel Strength", "subtitle": "Repairs damage to maintain structural integrity."},
          {"title": "Enhances Appearance", "subtitle": "Improves the look of scratched or damaged rims."},
          {"title": "Improves Driving Safety", "subtitle": "Fixes issues that can affect wheel performance."},
          {"title": "Ensures Smooth Ride", "subtitle": "Reduces vibrations caused by damaged rims."},
        ];
      } else {
        currentImage = ImageString.tyreBackground;
        currentBenefits = [
          {"title": "Improves Handling", "subtitle": "Ensures precise steering and better control."},
          {"title": "Promotes Even Tire Wear", "subtitle": "Helps tires wear evenly for longer life."},
          {"title": "Enhances Driving Stability", "subtitle": "Keeps your vehicle steady on the road."},
          {"title": "Boosts Fuel Efficiency", "subtitle": "Reduces resistance for better fuel usage."},
        ];
      }

      return Container(
        width: double.infinity,
        color: AppColors.backgroundOfScreenColor,
        padding: EdgeInsets.symmetric(
          vertical: isTiny ? 20 : 60,
          horizontal: isTiny ? 15 : 40,
        ),
        child: Column(
          children: [
            Text(
              "Key benefits",
              textAlign: TextAlign.center,
              style: TTextTheme.h1StyleBlack(context),
            ),
            const SizedBox(height: 15),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Text(
                "Highlighting the essential advantages of our services to ensure better performance, safety, and reliability for your vehicle.",
                textAlign: TextAlign.center,
                style: TTextTheme.medium16black(context),
              ),
            ),
            const SizedBox(height: 50),
            if (isMobileOrTablet)
              Column(
                children: [
                  _buildBenefitsList(context, currentBenefits),
                  const SizedBox(height: 40),
                  _buildBenefitImage(screenWidth, currentImage),
                ],
              )
            else
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: _buildBenefitsList(context, currentBenefits),
                  ),
                  const SizedBox(width: 50),
                  Expanded(
                    flex: 5,
                    child: _buildBenefitImage(screenWidth, currentImage),
                  ),
                ],
              ),
          ],
        ),
      );
    });
  }

  /// ----------- Extra Widgets ----------- ///

  Widget _buildBenefitsList(BuildContext context, List<Map<String, String>> benefitsData) {
    return Column(
      children: benefitsData.map((benefit) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: _buildBenefitCard(
            context,
            title: benefit["title"]!,
            subtitle: benefit["subtitle"]!,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBenefitCard(BuildContext context, {required String title, required String subtitle}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.backgroundOfScreenColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(
              Icons.check_box,
              color: AppColors.completedColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TTextTheme.h5Style(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TTextTheme.bodyRegular16(context).copyWith(
                    color: AppColors.tertiaryTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitImage(double screenWidth, String imageAsset) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        imageAsset,
        width: double.infinity,
        height: screenWidth < 600 ? 250 : 420,
        fit: BoxFit.cover,
      ),
    );
  }
}