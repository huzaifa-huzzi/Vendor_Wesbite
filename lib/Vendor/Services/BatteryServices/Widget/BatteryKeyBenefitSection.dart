import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/Services/ServicesController.dart';



class BatteryKeyBenefitsSection extends StatelessWidget {
  const BatteryKeyBenefitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobileOrTablet = screenWidth < 950;
    final bool isTiny = screenWidth <= 300;
    final controller = Get.find<ServicesController>();

    return Obx(() {
      final selectedBattery = controller.selectedBatteryService.value;
      final String? serviceTitle = selectedBattery?["title"];

      List<Map<String, String>> currentBenefits;
      String currentImage;
      if (serviceTitle == "Battery Replacment") {
        currentImage = ImageString.batteryReplacment1;
        currentBenefits = [
          {"title": "Accurate Life Prediction", "subtitle": "Determines precisely how much operational capability and lifespan remains inside cell structures."},
          {"title": "Prevents Stranded Failures", "subtitle": "Catches dead or weak cranking modules before they leave you stuck unexpectedly on road trips."},
          {"title": "Optimizes Starter Health", "subtitle": "Ensures clean voltage drops so starter gears don't experience heavy electronic stress levels."},
          {"title": "Tracks Hidden Resistance", "subtitle": "Identifies internal plate short-circuits that digital dashboard indicators fail to report."},
        ];
      } else if (serviceTitle == "Battery Charging") {
        currentImage = ImageString.batteryCharging1;
        currentBenefits = [
          {"title": "Instant Engine Cranking", "subtitle": "Delivers full factory-rated Cold Cranking Amps for seamless, reliable ignition cycles."},
          {"title": "Protects Digital Memories", "subtitle": "Maintains steady onboard computer parameters and radio preferences during setup updates."},
          {"title": "Corrosion-Free Seals", "subtitle": "Guarantees premium anti-acid terminal coats to halt resistance buildups permanently."},
          {"title": "Long-Term Warranty Shield", "subtitle": "Includes full factory backup coverage keeping your replacement investment secure."},
        ];
      } else if (serviceTitle == "Alternator Repair") {
        currentImage = ImageString.alternatorRepair1;
        currentBenefits = [
          {"title": "Continuous Power Supply", "subtitle": "Guarantees a steady charging flow to run electronics and headlights simultaneously."},
          {"title": "Halts Electrical Buzzing", "subtitle": "Clears out ripple current leakage spikes that interfere with radio and control computers."},
          {"title": "Eliminates Battery Drain", "subtitle": "Stops downstream current leaks to keep your vehicle cells full during overnight parking."},
          {"title": "Saves Drive Belt Fatigue", "subtitle": "Calibrates pulleys accurately to reduce structural friction drag across engine bearings."},
        ];
      } else if (serviceTitle == "Starter Motor Repair") {
        currentImage = ImageString.starterMotor1;
        currentBenefits = [
          {"title": "Rapid Ignition Response", "subtitle": "Triggers immediate flywheel engagement the second you turn your key or push start."},
          {"title": "Low Amp Current Draw", "subtitle": "Reduces high-power battery strain using highly polished, smooth internal armature paths."},
          {"title": "Perfect Gear Alignment", "subtitle": "Prevents catastrophic metallic damage across external ring gear teeth systems."},
          {"title": "Heavy-Duty Heat Shielding", "subtitle": "Utilizes premium thermal internal layouts to prevent hot-start failures on long journeys."},
        ];
      } else if (serviceTitle == "Wiring Inspection") {
        currentImage = ImageString.wiringInspection1;
        currentBenefits = [
          {"title": "Maximum Current Delivery", "subtitle": "Clears heavy restriction channels to allow uninterrupted power paths down to starters."},
          {"title": "Blocks Acidic Intrusion", "subtitle": "Uses dual-wall adhesive shrink insulation layers to seal raw copper elements away from roads."},
          {"title": "Flawless Chassis Grounding", "subtitle": "Restores solid frame electrical returns to completely resolve erratic sensor issues."},
          {"title": "Zero Vibration Friction", "subtitle": "Fits high-grade protection looms to prevent short-circuits caused by wiring friction."},
        ];
      } else if (serviceTitle == "Fuse Replacment") {
        currentImage = ImageString.fuseReplacment1;
        currentBenefits = [
          {"title": "Stops Overnight Dead Cells", "subtitle": "Traces hidden current drains to guarantee your vehicle starts up effortlessly every morning."},
          {"title": "Isolates Complex Shorts", "subtitle": "Locates problematic wires without resetting or damaging smart network layouts."},
          {"title": "Saves Factory Modules", "subtitle": "Verifies correct vehicle computer shutdown timers to keep main processors running smoothly."},
          {"title": "Audits Custom Accessories", "subtitle": "Ensures aftermarket sound systems or alarms are wired properly without draining power."},
        ];
      } else {
        currentImage = ImageString.batteryBackground;
        currentBenefits = [
          {"title": "Dependable Starting Power", "subtitle": "Advanced checks ensure your car cranks instantly under any environmental climate conditions."},
          {"title": "Stable Electrical Grid", "subtitle": "Maintains balanced current paths to protect fragile dashboard computer displays and sensors."},
          {"title": "Extended Battery Lifespan", "subtitle": "Timely terminal cleaning and alternator checks prevent premature cell decay."},
          {"title": "Expert Parasitic Scanning", "subtitle": "Identifies hidden overnight current drains accurately using high-end diagnostic tools."},
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

  /// ----------- Extra  Widgets ----------- ///

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