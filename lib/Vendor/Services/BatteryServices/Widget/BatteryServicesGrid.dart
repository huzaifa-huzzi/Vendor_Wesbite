import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/IconString.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/Services/Reusable%20Widget/PrimaryBtnOServices.dart';
import 'package:vendor_website/Vendor/Services/ServicesController.dart';


class BatteryServicesGrid extends StatelessWidget {
  const BatteryServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isTiny = screenWidth <= 300;
    final controller = Get.find<ServicesController>();

    final List<Map<String, dynamic>> batteryServicesData = [
      {
        "number": "01",
        "title": "Battery Replacement",
        "desc": "A professional digital health analysis evaluating voltage thresholds, cranking amp capacities, and overall internal cell resistance layout accurately.",
        "imagePath": ImageString.batteryReplacement,
        "time": "15-20 Min",
        "priceRange": "\$15-\$30",
        "whatsIncluded": [
          {"title": "Open Circuit Voltage Test", "desc": "Measures continuous static charge readiness using certified digital multi-meters."},
          {"title": "Load Performance Analysis", "desc": "Simulates structural engine starting drains to verify voltage stability scales properly."},
          {"title": "Terminal Corrosion Inspection", "desc": "Examines connection interfaces closely for resistive white or green sulfate layers."},
          {"title": "State-of-Health Printing", "desc": "Provides a comprehensive computerized summary report detailing total leftover operational life."},
        ]
      },
      {
        "number": "02",
        "title": "Battery Charging",
        "desc": "Restore your battery’s power with professional charging, ensuring reliable performance and preventing unexpected breakdowns.",
        "imagePath": ImageString.batteryCharging,
        "time": "20-30 Min",
        "priceRange": "\$120-\$250",
        "whatsIncluded": [
          {"title": "Memory Saver Configuration", "desc": "Attaches external backup power lines to shield dashboard settings and radio codes during swapping."},
          {"title": "Heavy-Duty Tie Down Reset", "desc": "Secures physical mounting frame brackets tightly to eliminate vibration-induced internal damage."},
          {"title": "Antioxidant Protective Spray", "desc": "Applies specialised technical terminal seals to block future micro-acid gas escapes completely."},
          {"title": "Old Core Eco-Recycling", "desc": "Processes used hazardous elements safely through fully certified environmental refinement channels."},
        ]
      },
      {
        "number": "03",
        "title": "Alternator Repair",
        "desc": "Detailed functional tracking or complete hardware replacement of your alternator to ensure your vehicle's charging matrix maintains a continuous power balance.",
        "imagePath": ImageString.alternatorRepair,
        "time": "1.5-2.5 Hours",
        "priceRange": "\$180-\$450",
        "whatsIncluded": [
          {"title": "Continuous Amperage Load Test", "desc": "Measures total output flow rates while tracking full vehicle electrical accessories simultaneously."},
          {"title": "Diode Ripple Current Scan", "desc": "Isolates internal component leaks using advanced digital scopes to stop engine computer buzzing issues."},
          {"title": "Drive Belt Tension Check", "desc": "Verifies mechanical spring tension pulleys to prevent slipping belts and premature bearing wear."},
          {"title": "Wiring Harness Drop Testing", "desc": "Scans main output cables for hidden inline resistance loops that cause battery drain errors."},
        ]
      },
      {
        "number": "04",
        "title": "Starter Motor Repair",
        "desc": "Advanced mechanical diagnostics and complete rebuilding of the starter motor assembly to guarantee rapid, dependable engine ignition every single time.",
        "imagePath": ImageString.starterMotor,
        "time": "1.5-3 Hours",
        "priceRange": "\$150-\$380",
        "whatsIncluded": [
          {"title": "Solenoid Relay Contact Test", "desc": "Tracks operational voltage drops across high-current internal copper discs directly."},
          {"title": "Flywheel Ring Gear Inspection", "desc": "Examines physical starter gear teeth matrices for cracks or worn contact edges carefully."},
          {"title": "Cranking Current Draw Scan", "desc": "Measures absolute starter motor power hunger parameters to catch tight armature bearings early."},
          {"title": "Ignition Switch Bypass Check", "desc": "Traces key command paths completely to separate dashboard issues from mechanical motor failures."},
        ]
      },
      {
        "number": "05",
        "title": "Wiring Inspection",
        "desc": "Professional renewal, deep mechanical cleaning, and structural reinforcement of heavy-gauge power lines to ensure unimpeded current flow paths.",
        "imagePath": ImageString.wiringInspection,
        "time": "30-45 Min",
        "priceRange": "\$40-\$90",
        "whatsIncluded": [
          {"title": "Hydraulic Lug Crimp Renewal", "desc": "Fuses heavy-duty copper terminal ends tightly using industrial high-tonnage compression machinery."},
          {"title": "Heat-Shrink Insulation Seal", "desc": "Applies dual-wall adhesive tubing matrices to block corrosive road splash elements permanently."},
          {"title": "Chassis Ground Path Scraping", "desc": "Polishes frame attachment points down to raw bare metal to optimize complete vehicle grounding circuits."},
          {"title": "Flexible Loom Shield Fitting", "desc": "Encloses loose power lines inside premium thermal conduits to prevent short-circuits from rubbing damages."},
        ]
      },
      {
        "number": "06",
        "title": "Fuse Replacement",
        "desc": "Protect your vehicle’s electrical system with fuse replacement, restoring proper function and preventing damage from electrical overloads.",
        "imagePath": ImageString.fuseReplacment,
        "time": "1-2 Hours",
        "priceRange": "\$60-\$150",
        "whatsIncluded": [
          {"title": "Inline Parasitic Drain Trace", "desc": "Monitors continuous sleep-mode milliamp draws using high-accuracy digital multimeters safely."},
          {"title": "Sequential Fuse-Pull Tracking", "desc": "Isolates problematic module paths selectively without causing vehicle network awakenings."},
          {"title": "Body Control Module Analysis", "desc": "Verifies smart network sleep timing windows using active factory computer scanning equipment."},
          {"title": "Aftermarket System Isolation", "desc": "Audits custom alarm, radio, or tracking installations for incorrect power hookup configurations."},
        ]
      },
    ];

    return Obx(() {
      final batteryService = controller.selectedBatteryService.value;

      if (batteryService != null) {
        return _buildBatteryDetailsView(context, batteryService, isTiny, controller);
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
              TextString.batteryTitle,
              textAlign: TextAlign.center,
              style: TTextTheme.h1StyleBlack(context),
            ),
            const SizedBox(height: 15),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Text(
             TextString.batterySubtitle,
                textAlign: TextAlign.center,
                style: TTextTheme.medium16black(context),
              ),
            ),
            const SizedBox(height: 50),
            Wrap(
              spacing: 25,
              runSpacing: 25,
              alignment: WrapAlignment.center,
              children: batteryServicesData.map((data) {
                return _buildMaintenanceCard(
                  context,
                  number: data["number"],
                  title: data["title"],
                  desc: data["desc"],
                  imagePath: data["imagePath"],
                  isTiny: isTiny,
                  onTap: () => controller.selectBatteryService(data),
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

  // Battery Details View
  Widget _buildBatteryDetailsView(BuildContext context, Map<String, dynamic> service, bool isTiny, ServicesController controller) {
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
                       TextString.tyreServiceDetail,
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
                  TextString.whatsIncluded,
                  style: TTextTheme.h1StyleBlack(context).copyWith(fontSize: isMobile ? 32 : 40, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Text(
                    TextString.whatsIncludedSubtitle,
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

  // Meta Info
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