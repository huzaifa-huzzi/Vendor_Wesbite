import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/Services/ServicesController.dart';
import '../../../../Resources/ImageString.dart' show ImageString;


class AcKeyBenefitsSection extends StatelessWidget {
  const AcKeyBenefitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobileOrTablet = screenWidth < 950;
    final bool isTiny = screenWidth <= 300;
    final controller = Get.find<ServicesController>();

    return Obx(() {
      final selectedAc = controller.selectedAcService.value;
      final String? serviceTitle = selectedAc?["title"];

      List<Map<String, String>> currentBenefits;
      String currentImage;
      if (serviceTitle == "AC Inspection") {
        currentImage = ImageString.acInspection1;
        currentBenefits = [
          {"title": "Restores Ice-Cold Air", "subtitle": "Optimizes temperature output to deliver immediate, refreshing cabin cooling."},
          {"title": "Maximizes Airflow Volume", "subtitle": "Clears ventilation blockages to guarantee powerful and steady fan distribution."},
          {"title": "Prevents Major Failures", "subtitle": "Identifies minor pressure variances early before they turn into costly damage."},
          {"title": "Improves Driving Comfort", "subtitle": "Maintains a perfectly stable, relaxed climate no matter how hot it gets outside."},
        ];
      } else if (serviceTitle == "AC Gas Refill") {
        currentImage = ImageString.acGas1;
        currentBenefits = [
          {"title": "Pinpoints Microscopic Leaks", "subtitle": "Isolates hidden pinhole escapes safely with UV dyes and advanced electronic sniffers."},
          {"title": "Stops Gas Wastage", "subtitle": "Prevents expensive refrigerant from continuously leaking out into the air."},
          {"title": "Protects the Environment", "subtitle": "Seals the system tightly to halt harmful greenhouse gas chemical emissions."},
          {"title": "Preserves Compressor Life", "subtitle": "Maintains necessary system pressures so the compressor doesn't overwork and burn."},
        ];
      } else if (serviceTitle == "Compressor Repair") {
        currentImage = ImageString.compressorRepair1;
        currentBenefits = [
          {"title": "Restores Core Pressure", "subtitle": "Re-establishes powerful system pumping power for consistent long-range cooling."},
          {"title": "Smooth, Quiet Operation", "subtitle": "Eliminates annoying metallic rattles, squeals, and heavy vibrations under your hood."},
          {"title": "Perfect Clutch Engagement", "subtitle": "Ensures the electromagnetic clutch cycles on and off safely with factory gaps."},
          {"title": "Optimized Power Delivery", "subtitle": "Reduces engine drag, helping your car run smoothly while the AC is running."},
        ];
      } else if (serviceTitle == "Condenser Repair") {
        currentImage = ImageString.condensorRepair1;
        currentBenefits = [
          {"title": "Eliminates Odors & Mold", "subtitle": "Neutralizes deep dashboard bacteria and fungal spores using specialized sanitizing foams."},
          {"title": "Fixes Deep-Dash Leaks", "subtitle": "Replaces or seals the hidden core safely to stop persistent cabin air pressure drops."},
          {"title": "Stops Interior Water Spills", "subtitle": "Flushes out blocked condensate tubes to prevent water logging your floor carpets."},
          {"title": "Pure Cabin Air Quality", "subtitle": "Delivers crisp, clean, and completely healthy oxygen fields straight to your lungs."},
        ];
      } else if (serviceTitle == "Heater Repair") {
        currentImage = ImageString.heaterRepair1;
        currentBenefits = [
          {"title": "Factory-Spec Cooling", "subtitle": "Restores refrigerant gas down to single-ounce tolerances for maximum sub-cooling."},
          {"title": "Deep Moisture Evacuation", "subtitle": "Boils off dangerous internal moisture chains via high-efficiency vacuum processing."},
          {"title": "Instant Temperature Drop", "subtitle": "Triggers rapid vent cooling curves within seconds of turning on the system."},
          {"title": "Upgraded Port Sealing", "subtitle": "Renews inner service valve stems completely to block future pressure leaks."},
        ];
      } else if (serviceTitle == "Cabin Filter Repair") {
        currentImage = ImageString.cabinFilter1;
        currentBenefits = [
          {"title": "Clears Fault Codes", "subtitle": "Scans internal OBD2 HVAC modules instantly to isolate electronic breakdown flags."},
          {"title": "Calibrates Air Direction", "subtitle": "Resets digital blend door actuators to guide hot and cold air exactly where directed."},
          {"title": "Accurate Sensor Tracking", "subtitle": "Monitors in-car cabin humidity and solar load parameters live in real-time."},
          {"title": "Flawless Interface Response", "subtitle": "Ensures center console buttons, dials, and screen backlights respond perfectly."},
        ];
      } else {
        currentImage = ImageString.acBackground;
        currentBenefits = [
          {"title": "Crisp Cooling Efficiency", "subtitle": "Advanced checks ensure your system drops cabin temperatures rapidly when needed."},
          {"title": "Enhanced Air Purity", "subtitle": "Prevents mold and allergen accumulation to maintain a fresh, healthy airflow."},
          {"title": "Extended System Lifespan", "subtitle": "Timely component calibrations and flushes save expensive compressors from wear."},
          {"title": "Expert Digital Tuning", "subtitle": "Identifies complex climate actuator faults accurately using specialized scanners."},
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