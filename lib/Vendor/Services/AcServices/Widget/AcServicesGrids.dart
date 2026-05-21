import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/IconString.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/Services/Reusable%20Widget/PrimaryBtnOServices.dart';
import 'package:vendor_website/Vendor/Services/ServicesController.dart';


class AcServicesGrid extends StatelessWidget {
  const AcServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isTiny = screenWidth <= 300;
    final controller = Get.find<ServicesController>();

    final List<Map<String, dynamic>> acServicesData = [
      {
        "number": "01",
        "title": "AC Inspection",
        "desc": "A comprehensive evaluation of your vehicle's air conditioning system to diagnose cooling efficiency, pressure variances, and airflow restrictions.",
        "imagePath": ImageString.acInspection,
        "time": "20-30 Min",
        "priceRange": "\$30-\$60",
        "whatsIncluded": [
          {"title": "Vent Temperature Testing", "desc": "Measures exact thermometer readings directly at output grills under loads."},
          {"title": "System Pressure Analysis", "desc": "Checks operational high and low side pressure loops against manufacturer targets."},
          {"title": "Belts & Hoses Inspection", "desc": "Examines external drive belts, connections, and flexible lines for cracks."},
          {"title": "Cabin Air Filter Check", "desc": "Inspects structural filtering matrices for restrictive blockage, dust, or mold buildup."},
        ]
      },
      {
        "number": "02",
        "title": "AC Gas Refill",
        "desc": "Advanced diagnostics utilizing premium fluorescent UV dyes and electronic sniffers to isolate microscopic refrigerant leaks safely.",
        "imagePath": ImageString.acGas,
        "time": "45-60 Min",
        "priceRange": "\$50-\$120",
        "whatsIncluded": [
          {"title": "UV Dye Injection Trace", "desc": "Circulates premium glowing dyes to illuminate hidden structural escape points clearly."},
          {"title": "Electronic Sniffer Scanning", "desc": "Sweeps core joints and seals with highly sensitive halogen gas sensors."},
          {"title": "Vacuum Hold Evacuation Test", "desc": "Applies deep vacuum limits to monitor system decay rates over duration intervals."},
          {"title": "Component Joint Inspection", "desc": "Examines O-rings, expansion valves, and compressor shaft gaskets for residue."},
        ]
      },
      {
        "number": "03",
        "title": "Compressor Repair",
        "desc": "Expert servicing or complete replacement of the air conditioning compressor unit to restore vital mechanical system pressure capabilities.",
        "imagePath": ImageString.compressorRepair,
        "time": "2-3 Hours",
        "priceRange": "\$350-\$850",
        "whatsIncluded": [
          {"title": "Clutch & Pulley Operation Test", "desc": "Verifies precise electromagnetic clutch gap adjustments and bearing smoothness."},
          {"title": "Old Refrigerant Recovery", "desc": "Safely extracts chemical containment volumes using sealed environmental systems."},
          {"title": "System Flush Verification", "desc": "Clears micro debris or metallic breakdown particles out from connecting lines."},
          {"title": "PAG Oil Balance Calibration", "desc": "Calculates and adds precise internal lubricant fluid ratios to shield internal pistons."},
        ]
      },
      {
        "number": "04",
        "title": " Condensor Repair",
        "desc": "Detailed servicing or replacement of the internal evaporator core to fix complex deep-dash leaks and eliminate recurring cabin odors.",
        "imagePath": ImageString.condensorRepair,
        "time": "3-5 Hours",
        "priceRange": "\$400-\$950",
        "whatsIncluded": [
          {"title": "Dashboard Assembly Extraction", "desc": "Safely gains entry past interior structural trim elements with specialized tools."},
          {"title": "Core Leak Pressure Testing", "desc": "Submerges structural core frameworks to verify integrity fields under stress."},
          {"title": "Drain Tube Clearing Action", "desc": "Flushes out restricted condensate passageways to stop internal floor water spills."},
          {"title": "Sanitizing Core Deodorization", "desc": "Applies specialized chemical foams to neutralize mold spores at localized zones."},
        ]
      },
      {
        "number": "05",
        "title": "Heater Repair",
        "desc": "Precision vacuuming and precise restoration of environmental refrigerant chemical weights to match factory climate control specifications.",
        "imagePath": ImageString.heaterRepair,
        "time": "30-45 Min",
        "priceRange": "\$80-\$180",
        "whatsIncluded": [
          {"title": "Deep Vacuum Moisture Evacuation", "desc": "Boils off internal moisture pockets using continuous high-efficiency vacuum cycles."},
          {"title": "Weight-Matched Gas Charging", "desc": "Introduces exact matching refrigerant amounts down to single-ounce tolerances safely."},
          {"title": "Performance Output Validation", "desc": "Verifies rapid vent drop curves to certify total sub-cooling operational metrics."},
          {"title": "Service Port Valve Renewal", "desc": "Tests and replaces internal core stems to halt future slow pressure escapes."},
        ]
      },
      {
        "number": "06",
        "title": "Cabin Filter Replacement",
        "desc": "Intelligent electronic scanning of digital dashboard controls, blend door actuators, and internal cabin air temperature sensor modules.",
        "imagePath": ImageString.cabinFilter,
        "time": "45-60 Min",
        "priceRange": "\$60-\$130",
        "whatsIncluded": [
          {"title": "OBD2 Module Fault Scanning", "desc": "Interrogates climate modules to read active diagnostic trouble codes instantly."},
          {"title": "Blend Door Actuator Calibration", "desc": "Commands and traces motorized positioning paths to ensure correct air distributions."},
          {"title": "Sensor Signal Voltage Analysis", "desc": "Monitors active solar load and in-car cabin humidity parameters live."},
          {"title": "Control Head Firmware Testing", "desc": "Tests main interface button response matrices and backlight control inputs."},
        ]
      },
    ];

    return Obx(() {
      final acService = controller.selectedAcService.value;

      if (acService != null) {
        return _buildAcDetailsView(context, acService, isTiny, controller);
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
              "Ac and Heating Services",
              textAlign: TextAlign.center,
              style: TTextTheme.h1StyleBlack(context),
            ),
            const SizedBox(height: 15),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Text(
                "Restore crisp cooling efficiency, eliminate unpleasant odors, and ensure accurate climate management across every journey with our professional diagnostics, leak detection, and precision system recharges.",
                textAlign: TextAlign.center,
                style: TTextTheme.medium16black(context),
              ),
            ),
            const SizedBox(height: 50),
            Wrap(
              spacing: 25,
              runSpacing: 25,
              alignment: WrapAlignment.center,
              children: acServicesData.map((data) {
                return _buildMaintenanceCard(
                  context,
                  number: data["number"],
                  title: data["title"],
                  desc: data["desc"],
                  imagePath: data["imagePath"],
                  isTiny: isTiny,
                  onTap: () => controller.selectAcService(data),
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

  // AC Details View
  Widget _buildAcDetailsView(BuildContext context, Map<String, dynamic> service, bool isTiny, ServicesController controller) {
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