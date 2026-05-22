import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/Services/ServicesController.dart';

class BrakeKeyBenefitsSection extends StatelessWidget {
  const BrakeKeyBenefitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobileOrTablet = screenWidth < 950;
    final bool isTiny = screenWidth <= 300;
    final controller = Get.find<ServicesController>();

    return Obx(() {
      final selectedBrake = controller.selectedBrakeService.value;
      final String? serviceTitle = selectedBrake?["title"];

      List<Map<String, String>> currentBenefits;
      String currentImage;
      if (serviceTitle == "Brake Inspection") {
        currentImage = ImageString.brakeInspection1;
        currentBenefits = [
          {"title": "Early Wear Detection", "subtitle": "Catches thin friction materials before they damage expensive metal parts."},
          {"title": "Maximum Stopping Power", "subtitle": "Verifies that your system delivers original deceleration capacities safely."},
          {"title": "Hydraulic Pressure Check", "desc": "Ensures no hidden internal micro-leaks are dropping pedal response levels."},
          {"title": "Complete Road Safety", "subtitle": "Drive with absolute confidence knowing your safety components are verified."},
        ];
      } else if (serviceTitle == "Brake Pad Replacement") {
        currentImage = ImageString.brakePad1;
        currentBenefits = [
          {"title": "Eliminates Metallic Noise", "subtitle": "Premium compound integrations completely mute annoying squeals and grinds."},
          {"title": "Shorter Stopping Distance", "subtitle": "Significantly decreases vital braking gaps during emergency reactions."},
          {"title": "Reduced Rotor Wear", "subtitle": "Gentle but durable compound structures maximize brake disc operational life."},
          {"title": "Consistent Pedal Feel", "subtitle": "Restores crisp, highly predictable response inputs directly under your foot."},
        ];
      } else if (serviceTitle == "Brake Rotor Resurfacing") {
        currentImage = ImageString.discRotor1;
        currentBenefits = [
          {"title": "Cancels Pedal Pulsations", "subtitle": "Removes high spots and variations to clear out severe steering vibrations."},
          {"title": "Smooth Pad Bedding", "subtitle": "Creates a flat layout matching profile for rapid new component adaptation."},
          {"title": "Saves Replacement Costs", "subtitle": "Restores existing heavy rotors back to safety parameters cleanly."},
          {"title": "Thermal Heat Shedding", "subtitle": "Restructures smooth surface fields to dissipate heavy operational heat fast."},
        ];
      } else if (serviceTitle == "Brake Fluid Flush") {
        currentImage = ImageString.brakeFluid1;
        currentBenefits = [
          {"title": "Removes Moisture Build-up", "subtitle": "Prevents dangerous fluid boiling conditions during heavy downhill descents."},
          {"title": "Anti-Corrosion Shield", "subtitle": "Stops chemical oxidation from eating away internal metal piston channels."},
          {"title": "Solid Hydraulic Link", "subtitle": "Removes spongy travel sensations by securing continuous dense fluid chains."},
          {"title": "Protects Seals & O-Rings", "subtitle": "Keeps internal synthetic rubber boundaries pliable and completely tear-free."},
        ];
      } else if (serviceTitle == "Brake Caliper Repair") {
        currentImage = ImageString.brakeCaliper1;
        currentBenefits = [
          {"title": "Balanced Brake Pressures", "subtitle": "Ensures fluid forces apply equally without pulling the chassis sideways."},
          {"title": "Frees Sticky Pistons", "subtitle": "Stops residual constant pad dragging that causes premature thermal wear."},
          {"title": "Prevents Fluid Leaks", "subtitle": "Double tightens pressure seals to retain static clamping limits safely."},
          {"title": "Smooth Float Movement", "subtitle": "Lubricated slider pins let caliper frames float cleanly inline."},
        ];
      } else if (serviceTitle == "ABS Diagnostic") {
        currentImage = ImageString.diagnosticOne;
        currentBenefits = [
          {"title": "Prevents Wheel Lockup", "subtitle": "Ensures directional skid steering controls remain responsive on slick roads."},
          {"title": "Clears Dashboard Lights", "subtitle": "Pinpoints exact sensor breakdowns to turn off persistent warning alerts."},
          {"title": "Sensor Signal Clarity", "subtitle": "Cleans magnetic encoder pickup loops to track wheel speeds perfectly."},
          {"title": "Intelligent Braking Links", "subtitle": "Restores vital emergency autonomous braking data streams flawlessly."},
        ];
      } else {
        currentImage = ImageString.brakeServiceBackground;
        currentBenefits = [
          {"title": "Optimal Braking Power", "subtitle": "Advanced component checks ensure your vehicle stops immediately when needed."},
          {"title": "Enhanced Road Safety", "subtitle": "Prevents unexpected hydraulic failures with precise component monitoring."},
          {"title": "Extended Component Life", "subtitle": "Timely resurfacing and flushes save pads and rotors from early wear."},
          {"title": "Expert Calibrations", "subtitle": "Identifies complex electronic ABS faults accurately using specialized tools."},
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
              TextString.tyreKeyBenefitTitle,
              textAlign: TextAlign.center,
              style: TTextTheme.h1StyleBlack(context),
            ),
            const SizedBox(height: 15),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Text(
               TextString.tyreKeyBenefitSubtitle,
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

  /// ----------- Brake Local Helper Widgets ----------- ///

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