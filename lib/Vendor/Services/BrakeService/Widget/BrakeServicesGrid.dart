import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/IconString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/Services/Reusable%20Widget/PrimaryBtnOServices.dart';
import 'package:vendor_website/Vendor/Services/ServicesController.dart';

class BrakeServicesGrid extends StatelessWidget {
  const BrakeServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isTiny = screenWidth <= 300;
    final controller = Get.find<ServicesController>();

    final List<Map<String, dynamic>> brakeServicesData = [
      {
        "number": "01",
        "title": "Brake Inspection",
        "desc": "Comprehensive brake system evaluation ensures early wear detection, maximum stopping power, and complete peace of mind on the road.",
        "imagePath": ImageString.brakeInspection,
        "time": "30-45 Min",
        "priceRange": "\$40-\$90",
        "whatsIncluded": [
          {"title": "Brake Pad Wear Analysis", "desc": "Measures remaining lining thickness to evaluate overall component life."},
          {"title": "Rotor & Disc Inspection", "desc": "Checks for surface scoring, thermal cracks, or severe warping damage."},
          {"title": "Brake Line Fluid Check", "desc": "Inspects hydraulic connections for signs of moisture or high leak risks."},
          {"title": "Caliper Operation Test", "desc": "Ensures hydraulic pistons compress smoothly without binding or sticking."},
        ]
      },
      {
        "number": "02",
        "title": "Brake Pad Replacement",
        "desc": "Premium grade brake pad installation eliminates grinding noises, restores tactile pedal feel, and shortens vital stopping distances.",
        "imagePath": ImageString.brakePad,
        "time": "30-45 Min",
        "priceRange": "\$40-\$90",
        "whatsIncluded": [
          {"title": "Old Pad Removal & Cleanup", "desc": "Removes contaminated debris and worn lining blocks from the slider rails."},
          {"title": "Premium Brake Pad Fitting", "desc": "Installs high-coefficient ceramic or semi-metallic friction materials safely."},
          {"title": "Hardware Clip Renewal", "desc": "Replaces old anti-rattle shims and return springs to prevent vibrations."},
          {"title": "Contact Point Lubrication", "desc": "Applies high-temperature synthetic grease to slider pins for quiet operation."},
        ]
      },
      {
        "number": "03",
        "title": "Brake Rotor Resurfacing",
        "desc": "Precision lathe resurfacing removes rough surface imperfections, cancels pedal pulsations, and ensures perfect new pad bedding.",
        "imagePath": ImageString.discRotor,
        "time": "30-45 Min",
        "priceRange": "\$40-\$90",
        "whatsIncluded": [
          {"title": "Disc Thickness Verification", "desc": "Ensures rotors stay well above minimum safety parameters before machining."},
          {"title": "Precision Lathe Turning", "desc": "Shaves microscopic layers off the metal face to achieve flat alignment."},
          {"title": "True Cross-Hatch Finishing", "desc": "Creates a non-directional finish for immediate friction compatibility."},
          {"title": "Runout Measurement", "desc": "Tests lateral movement tolerances using dial indicators post-machining."},
        ]
      },
      {
        "number": "04",
        "title": "Brake Fluid Flush",
        "desc": "Complete hydraulic system purge extracts dangerous moisture, prevents internal component corrosion, and stabilizes solid pedal pressure.",
        "imagePath": ImageString.brakeFluid,
        "time": "30-45 Min",
        "priceRange": "\$40-\$90",
        "whatsIncluded": [
          {"title": "Contaminated Fluid Extraction", "desc": "Drains oxidized, dark, and moisture-heavy fluid from the main reservoir."},
          {"title": "Hydraulic Line Purging", "desc": "Forces clean synthetic fluid through lines until old residue is gone."},
          {"title": "Pressure Bleeding Sequence", "desc": "Removes micro air bubbles from all four caliper channels systematically."},
          {"title": "Master Cylinder Test", "desc": "Evaluates internal valve pressure seals under static foot loading."},
        ]
      },
      {
        "number": "05",
        "title": "Brake Caliper Repair",
        "desc": "Professional caliper rebuilding frees frozen pistons, secures balanced pressure deployment, and stops vehicle pulling issues.",
        "imagePath": ImageString.brakeCaliper,
        "time": "30-45 Min",
        "priceRange": "\$40-\$90",
        "whatsIncluded": [
          {"title": "Piston Assembly Extraction", "desc": "Disassembles caliper housing units to clear internal sleeve walls safely."},
          {"title": "Rubber Boot & Seal Replacement", "desc": "Installs fresh pressure seals to shield sliding zones from road grit."},
          {"title": "Guide Pin Straightening", "desc": "Cleans or replaces slider paths to secure clean floating motion alignment."},
          {"title": "Hydraulic Leak Integrity Test", "desc": "Pressure checks seals to guarantee zero brake pressure drop over time."},
        ]
      },
      {
        "number": "06",
        "title": "ABS Diagnostic",
        "desc": "Identify and resolve issues in your ABS system with advanced diagnostics, ensuring reliable braking control and improved safety in all driving conditions.",
        "imagePath": ImageString.brakeDiagnostic,
        "time": "30-45 Min",
        "priceRange": "\$40-\$90",
        "whatsIncluded": [
          {"title": "ABS Sensor Inspection", "desc": "Scans and tests individual wheel speed sensors for signal interruptions or structural debris."},
          {"title": "Control Module Scanning", "desc": "Reads deep electronic fault logs from the ABS computer to decode actuator failures."},
          {"title": "Hydraulic Pump Testing", "desc": "Verifies fluid pressure modulator pumps toggle cleanly during emergency stops."},
          {"title": "Wiring Harness Continuity", "desc": "Traces critical voltage links across the braking chassis to clear ghost warning lights."},
        ]
      },
    ];

    return Obx(() {
      final brakeService = controller.selectedBrakeService.value;

      if (brakeService != null) {
        return _buildBrakeDetailsView(context, brakeService, isTiny, controller);
      }

      return Container(
        width: double.infinity,
        color: AppColors.backgroundOfScreenColor,
        padding: EdgeInsets.symmetric(
          vertical: isTiny ? 20 : 60,
          horizontal: isTiny ? 10 : 20,
        ),
        child: Column(
          children: [
            Text(
              "Brake Services",
              textAlign: TextAlign.center,
              style: TTextTheme.h1StyleBlack(context),
            ),
            const SizedBox(height: 15),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Text(
                "Maintain optimal stopping power and road safety with our specialized brake system diagnostics, premium replacements, and hydraulic flushes.",
                textAlign: TextAlign.center,
                style: TTextTheme.medium16black(context),
              ),
            ),
            const SizedBox(height: 50),
            Wrap(
              spacing: 25,
              runSpacing: 25,
              alignment: WrapAlignment.center,
              children: brakeServicesData.map((data) {
                return _buildMaintenanceCard(
                  context,
                  number: data["number"],
                  title: data["title"],
                  desc: data["desc"],
                  imagePath: data["imagePath"],
                  isTiny: isTiny,
                  onTap: () => controller.selectBrakeService(data),
                );
              }).toList(),
            ),
          ],
        ),
      );
    });
  }

  /// ---------- Extra Widgets -------- ///

  // Maintenance Card Layout
  Widget _buildMaintenanceCard(
      BuildContext context, {
        required String number,
        required String title,
        required String desc,
        required String imagePath,
        required bool isTiny,
        required VoidCallback onTap,
      }) {
    final screenWidth = MediaQuery.of(context).size.width;

    double cardWidth;
    if (screenWidth > 1200) {
      cardWidth = (screenWidth / 3) - 60;
    } else if (screenWidth > 700) {
      cardWidth = (screenWidth / 2) - 50;
    } else {
      cardWidth = screenWidth - 40;
    }

    return Container(
      width: cardWidth,
      constraints: const BoxConstraints(minWidth: 300),
      padding: EdgeInsets.all(isTiny ? 16 : 20),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.tertiaryTextColor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: TTextTheme.numbering(context),
          ),
          const SizedBox(height: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: TTextTheme.h5Style(context),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 120,
            child: Text(
              desc,
              style: TTextTheme.bodyRegular16(context),
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 25),
          PrimaryBtnOfServices(
            text: "View Details",
            width: double.infinity,
            borderRadius: BorderRadius.circular(8),
            onTap: onTap,
          ),
        ],
      ),
    );
  }

  // Brake Details View
  Widget _buildBrakeDetailsView(BuildContext context, Map<String, dynamic> service, bool isTiny, ServicesController controller) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;
    final List<dynamic> whatsIncluded = service["whatsIncluded"];

    return Container(
      width: double.infinity,
      color: AppColors.backgroundOfScreenColor,
      padding: EdgeInsets.symmetric(
        vertical: isTiny ? 20 : 60,
        horizontal: isTiny ? 15 : 60,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(isTiny ? 16 : 32),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        service["imagePath"],
                        width: double.infinity,
                        height: screenWidth < 600 ? 200 : 450,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      service["title"],
                      style: TTextTheme.h1StyleBlack(context),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        "Service Detail",
                        style: TTextTheme.medium16white(context),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 40,
                      runSpacing: 15,
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 250),
                          child: _buildMetaInfo(context, IconString.hours, "Time", service["time"]),
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 250),
                          child: _buildMetaInfo(context, IconString.dollar, "Price Range", service["priceRange"]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Text(
                      service["desc"],
                      style: TTextTheme.bodyRegular16Table(context),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Center(
                child: Text(
                  "What's Included",
                  style: TTextTheme.h1StyleBlack(context).copyWith(fontSize: isMobile ? 32 : 40, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Text(
                    "Keep your vehicle running smoothly and reliably with our complete car service. From routine maintenance to full system checks, we ensure every part of your car stays in top condition.",
                    textAlign: TextAlign.center,
                    style: TTextTheme.bodyRegular16(context),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: whatsIncluded.map((item) {
                    double includeCardWidth;
                    if (isMobile) {
                      includeCardWidth = screenWidth - 40;
                    } else if (screenWidth < 1100) {
                      includeCardWidth = (screenWidth / 2) - 40;
                    } else {
                      includeCardWidth = 430;
                    }

                    return Container(
                      width: includeCardWidth,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["title"]!,
                            style: TTextTheme.h5Style(context),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item["desc"]!,
                            style: TTextTheme.bodyRegular16(context),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Meta Info Layout helper
  Widget _buildMetaInfo(BuildContext context, String icon, String label, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          icon,
          colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
          width: 20,
          height: 20,
          placeholderBuilder: (BuildContext context) => const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TTextTheme.bodyRegular16SecondarColor(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: TTextTheme.h5Style(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}