import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/Services/ServicesController.dart';

class EngineKeyBenefitsSection extends StatelessWidget {
  const EngineKeyBenefitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobileOrTablet = screenWidth < 950;
    final bool isTiny = screenWidth <= 300;
    final controller = Get.find<ServicesController>();

    return Obx(() {
      final selectedEngine = controller.selectedEngineService.value;
      final String? serviceTitle = selectedEngine?["title"];
      List<Map<String, String>> currentBenefits;
      String currentImage;
      if (serviceTitle == "Engine Diagnostic") {
        currentImage = ImageString.engineDiagnostic1;
        currentBenefits = [
          {"title": "Accurate Fault Detection", "subtitle": "Identifies hidden engine problems quickly before they get worse."},
          {"title": "Prevents Major Repairs", "subtitle": "Catches minor component failures early to avoid massive costs."},
          {"title": "Optimized Efficiency", "subtitle": "Ensures sensors and systems are tuned for perfect combustion."},
          {"title": "Restores Peace of Mind", "subtitle": "Drive safely knowing your engine health is fully verified."},
        ];
      } else if (serviceTitle == "Engine Repair") {
        currentImage = ImageString.engineRepair1;
        currentBenefits = [
          {"title": "Restored Power & Torque", "subtitle": "Brings back original acceleration and pulling performance."},
          {"title": "Leak & Noise Elimination", "subtitle": "Fixes annoying ticks, knocks, and messy oil/coolant drips."},
          {"title": "Quality Component Uses", "subtitle": "Guarantees reliable operation with premium replacement parts."},
          {"title": "Prevents Critical Failure", "subtitle": "Avoids complete engine seizure or catastrophic damage."},
        ];
      } else if (serviceTitle == "Timing Belt Replacement") {
        currentImage = ImageString.timingBelt1;
        currentBenefits = [
          {"title": "Synchronized Engine Valves", "subtitle": "Ensures pistons and valves never collide dangerously."},
          {"title": "Smoother Idle Quality", "subtitle": "Eliminate engine vibrations and rough running conditions."},
          {"title": "Avoids Engine Seizure", "subtitle": "Prevents catastrophic internal breakage from snapped belts."},
          {"title": "Restored Valve Efficiency", "subtitle": "Maximizes horsepower delivery through accurate timing cycles."},
        ];
      } else if (serviceTitle == "Fuel Injector Cleaning") {
        currentImage = ImageString.engineTuneup1;
        currentBenefits = [
          {"title": "Perfect Fuel Atomization", "subtitle": "Restores fine mist spray pattern for complete combustion."},
          {"title": "Eliminates Flat Spots", "subtitle": "Cures hesitation during acceleration and rough throttle inputs."},
          {"title": "Restored Fuel Economy", "subtitle": "Stops fuel wastage caused by clogged or leaking injectors."},
          {"title": "Reduced Smoky Emissions", "subtitle": "Lowers carbon build-up and dirty exhaust output levels."},
        ];
      } else if (serviceTitle == "Cooling System Service") {
        currentImage = ImageString.coolingSystem1;
        currentBenefits = [
          {"title": "Constant Overheat Protection", "subtitle": "Keeps engine block within perfectly safe thermal boundaries."},
          {"title": "Rust & Scale Elimination", "subtitle": "Flushes out corrosive particles from water jacket pathways."},
          {"title": "Extended Radiator Life", "subtitle": "Prevents internal pressure cracks and header tank seam leaks."},
          {"title": "Optimal Cabin Heating", "subtitle": "Ensures consistent core heater matrix operation during winter."},
        ];
      } else if (serviceTitle == "Head Gasket Repair") {
        currentImage = ImageString.headGasket1;
        currentBenefits = [
          {"title": "Restored Cylinder Pressure", "subtitle": "Regains maximum compression seals across all combustion chambers."},
          {"title": "Zero Fluid Intermixing", "subtitle": "Stops dangerous coolant leaks into the oil pan lubrication network."},
          {"title": "Clean Tailpipe Operation", "subtitle": "Halts white sweet-smelling smoke clouds from internal coolant burning."},
          {"title": "Protected Engine Integrity", "subtitle": "Shields block and cylinder head surfaces from severe erosion cracks."},
        ];
      } else {
        currentImage = ImageString.keyBenefitPic;
        currentBenefits = [
          {"title": "Optimized Performance", "subtitle": "Advanced tuning ensures your engine delivers maximum power."},
          {"title": "Long-Term Reliability", "subtitle": "Prevents unexpected breakdowns with precise component checks."},
          {"title": "Fuel Efficiency", "subtitle": "Clean and properly repaired parts reduce fuel wastage."},
          {"title": "Expert Diagnosis", "subtitle": "Identifies issues accurately using cutting-edge scanner tools."},
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
                "Highlighting the essential advantages of our engine services to ensure better performance, safety, and reliability for your vehicle.",
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

  /// ----------- Engine Local Helper Widgets ----------- ///

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