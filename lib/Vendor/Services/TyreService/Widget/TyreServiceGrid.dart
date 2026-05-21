import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/IconString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/Services/Reusable%20Widget/PrimaryBtnOServices.dart';
import 'package:vendor_website/Vendor/Services/ServicesController.dart';

class TyreServicesGrid extends StatelessWidget {
  const TyreServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isTiny = screenWidth <= 300;
    final controller = Get.find<ServicesController>();
    final List<Map<String, dynamic>> tyreServicesData = [
      {
        "number": "01",
        "title": "Tyre Alignment",
        "desc": "Precision computer-controlled wheel alignment adjusts suspension angles to ensure perfectly straight tracking, preventing uneven tire wear.",
        "imagePath": ImageString.tyreAlignment,
        "time": "30-45 Min",
        "priceRange": "\$40-\$90",
        "whatsIncluded": [
          {"title": "Camber, Caster & Toe Check", "desc": "Measures and realigns all three geometric suspension angles accurately."},
          {"title": "Steering Wheel Centering", "desc": "Adjusts tie rods to guarantee the steering wheel sits completely straight."},
          {"title": "Suspension Inspection", "desc": "Checks control arms, ball joints, and bushings for loose or damaged units."},
          {"title": "Digital Alignment Printout", "desc": "Provides a comprehensive computerized before-and-after specification report."},
        ]
      },
      {
        "number": "02",
        "title": "Tyre Balancing",
        "desc": "High-speed wheel balancing eliminates high-frequency cabin vibrations and protects your steering and suspension components from early wear.",
        "imagePath": ImageString.tyreBalancing,
        "time": "30-45 Min",
        "priceRange": "\$40-\$90",
        "whatsIncluded": [
          {"title": "Dynamic Spin Testing", "desc": "Spins the assembly on digital balancers to pinpoint heavy unbalance areas."},
          {"title": "Eco-Friendly Weight Fitting", "desc": "Applies precise corrective matrix weights onto the inner or outer wheel rim."},
          {"title": "Tread Debris Removal", "desc": "Clears trapped gravel or stones from grooves to ensure clean spin tracking."},
          {"title": "Rim Runout Verification", "desc": "Checks for structural rim warps or radial bends before concluding calibration."},
        ]
      },
      {
        "number": "03",
        "title": "Tyre Rotation",
        "desc": "Regular positional switching distributes front and rear tread wear evenly, maximizes tire lifespan, and maintains consistent driving grip.",
        "imagePath": ImageString.tyreRotation,
        "time": "30-45 Min",
        "priceRange": "\$40-\$90",
        "whatsIncluded": [
          {"title": "Pattern Matched Swapping", "desc": "Rotates positions based on drive configurations (Forward Cross, X-Pattern, etc.)."},
          {"title": "Brake Dust Layer Cleansing", "desc": "Cleans mounting faces and hubs while wheels are dismounted from axles."},
          {"title": "Tread Depth Measurement", "desc": "Logs exact millimeter depth readings across all tires to monitor wear life."},
          {"title": "Lug Nut Torque Spec Calibration", "desc": "Secures all wheels using mechanical torque wrenches to exact factory settings."},
        ]
      },
      {
        "number": "04",
        "title": "Tyre Replacement",
        "desc": "Ensure optimal safety and performance with timely tyre replacement, providing better grip, improved handling, and a smoother driving experience.",
        "imagePath": ImageString.tyreReplacement,
        "time": "30-45 Min",
        "priceRange": "\$40-\$90",
        "whatsIncluded": [
          {"title": "Cold Inflation Optimization", "desc": "Adjusts tire pressure precisely to matching doorjamb placard requirements."},
          {"title": "Valve Stem Leak Screening", "desc": "Tests valve cores and safety caps with immersion spray for micro air leaks."},
          {"title": "Spare Tire Inflation", "desc": "Inspects and inflates the trunk/underside backup tire to proper safety pressures."},
          {"title": "TPMS Dashboard Reset", "desc": "Recalibrates the digital monitoring system sensors to clear warning icons."},
        ]
      },
      {
        "number": "05",
        "title": "Tyre Puncture Repair",
        "desc": "Professional patch-and-plug repairs safely seal tread penetrations from nails or sharp road debris, restoring full structural air sealing.",
        "imagePath": ImageString.punctureRepair,
        "time": "30-45 Min",
        "priceRange": "\$40-\$90",
        "whatsIncluded": [
          {"title": "Internal Liner Inspection", "desc": "Dismounts tire completely to check for hidden inner sidewall bruising or cuts."},
          {"title": "Synergistic Plug & Patch Fit", "desc": "Installs permanent vulcanizing combination repair units inside the tread."},
          {"title": "Injury Channel Reaming", "desc": "Cleans the puncture path with carbide cutters to eliminate rusted steel belts."},
          {"title": "Post-Repair Leak Testing", "desc": "Submerges the pressurized assembly in testing tanks to verify 100% sealing."},
        ]
      },
      {
        "number": "06",
        "title": "Rim Repair",
        "desc": "Restore damaged rims with professional repair, improving wheel strength, enhancing appearance, and ensuring safe, smooth driving performance.",
        "imagePath": ImageString.tyreReplacement,
        "time": "30-45 Min",
        "priceRange": "\$40-\$90",
        "whatsIncluded": [
          {"title": "Aesthetic Old Tyre Stripping", "desc": "Safely peels worn carcasses using automated rubber tire changing machines."},
          {"title": "Premium Valve Stem Renewal", "desc": "Replaces old rubber inflation valve stems with fresh air-tight assemblies."},
          {"title": "Bead Seat Corrosion Scraping", "desc": "Cleans inner alloy rim flange seats to eliminate slow structural air leaks."},
          {"title": "Lubricated Tire Mounting", "desc": "Applies special mounting paste to seat tire beads cleanly without tears."},
        ]
      },
    ];

    return Obx(() {
      final tyreService = controller.selectedTyreService.value;

      if (tyreService != null) {
        return _buildTyreDetailsView(context, tyreService, isTiny, controller);
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
              "Tyre and wheel  Services",
              textAlign: TextAlign.center,
              style: TTextTheme.h1StyleBlack(context),
            ),
            const SizedBox(height: 15),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Text(
                "Optimize road grip, improve fuel efficiency, and maximize tread lifespan with our precision computerized alignments, balancing, and premium replacements.",
                textAlign: TextAlign.center,
                style: TTextTheme.medium16black(context),
              ),
            ),
            const SizedBox(height: 50),
            Wrap(
              spacing: 25,
              runSpacing: 25,
              alignment: WrapAlignment.center,
              children: tyreServicesData.map((data) {
                return _buildMaintenanceCard(
                  context,
                  number: data["number"],
                  title: data["title"],
                  desc: data["desc"],
                  imagePath: data["imagePath"],
                  isTiny: isTiny,
                  onTap: () => controller.selectTyreService(data),
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
        crossAxisAlignment:  CrossAxisAlignment.start,
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

  // Tyre Details View
  Widget _buildTyreDetailsView(BuildContext context, Map<String, dynamic> service, bool isTiny, ServicesController controller) {
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