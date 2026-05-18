import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/IconString.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/Services/Reusable%20Widget/PrimaryBtnOServices.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Vendor/Services/ServicesController.dart';

class GeneralMaintenancesGrid extends StatelessWidget {
  const GeneralMaintenancesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isTiny = screenWidth <= 300;
    final controller = Get.find<ServicesController>();


    final List<Map<String, dynamic>> servicesData = [
      {
        "number": "01",
        "title": "Oil Change",
        "desc": "An oil change is essential to keep your engine properly lubricated and running smoothly. Fresh oil reduces friction, prevents overheating.",
        "imagePath": ImageString.oilChange,
        "time": "30-45 Min",
        "priceRange": "\$40-\$90",
        "whatsIncluded": [
          {"title": "Heater Core Inspection", "desc": "Checks for leaks or blockages to ensure proper heat flow"},
          {"title": "Blower Motor Check", "desc": "Ensures smooth airflow and consistent heating performance"},
          {"title": "Thermostat Testing", "desc": "Maintains correct temperature control for efficient heating"},
          {"title": "Coolant & Leak Inspection", "desc": "Prevents overheating and ensures proper system function"},
        ]
      },
      {
        "number": "02",
        "title": "Filter Replacement",
        "desc": "Regular filter replacement is essential for maintaining optimal performance in your vehicle. By regularly replacing air, oil, and fuel filters, you ensure clean airflow and proper fluid circulation, which helps the engine run efficiently.",
        "imagePath": ImageString.filterReplacment,
        "time": "30-45 Min",
        "priceRange": "\$40-\$90",
        "whatsIncluded": [
          {"title": "Air Filter Replacement", "desc": "Ensures clean airflow to the engine for better performance."},
          {"title": "Oil Filter Replacement", "desc": "Keeps engine oil free from impurities, protecting engine parts."},
          {"title": "Fuel Filter Replacement", "desc": "Prevents dust and debris from reaching the fuel system."},
          {"title": "Improved Engine Efficiency", "desc": "Helps your car run smoother and more reliably."},
        ]
      },
      {
        "number": "03",
        "title": "Fluid Check & Top-Up",
        "desc": "Regular fluid checks and top-ups ensure that all vital fluids in your vehicle, including engine oil, coolant, brake fluid, and transmission fluid, are maintained at their optimal levels.",
        "imagePath": ImageString.fluidCheck,
        "time": "30-45 Min",
        "priceRange": "\$40-\$90",
        "whatsIncluded": [
          {"title": "Engine Oil Check & Top-up", "desc": "Ensures the engine oil is at the correct level for smooth performance and engine protection."},
          {"title": "Coolant Check & Top-up", "desc": "Maintains the proper coolant level to prevent overheating and keep your engine running efficiently."},
          {"title": "Brake Fluid Check & Top-up", "desc": "Keeps the brake system functioning safely and reliably."},
          {"title": "Transmission Fluid Check & Top-up", "desc": "Ensures smooth gear shifts and protects transmission components from wear."},
        ]
      },
      {
        "number": "04",
        "title": "Engine Tune-Up",
        "desc": "An engine tune-up involves a thorough inspection and precise adjustment of key engine components to ensure your vehicle operates at its best. This essential service helps optimize performance, improve fuel efficiency, and maintain smooth operation.",
        "imagePath": ImageString.engineTune,
        "time": "30-45 Min",
        "priceRange": "\$40-\$90",
        "whatsIncluded": [
          {"title": "Spark Plug Check & Replacement", "desc": "Ensures proper ignition and smooth engine starts."},
          {"title": "Ignition System Inspection", "desc": "Verifies coils, wires, and related components are functioning correctly."},
          {"title": "Belts and Hoses Check", "desc": "Detects wear or damage to prevent breakdowns."},
          {"title": "Fuel and Air System Testing", "desc": "Maintains optimal fuel delivery and airflow for efficiency."},
        ]
      },
      {
        "number": "05",
        "title": "Vehicle Inspection",
        "desc": "A vehicle inspection involves a thorough check of all key components, including brakes, tyres, engine, and fluid levels, to ensure everything is functioning properly and safely.",
        "imagePath": ImageString.vehicleInspection,
        "time": "30-45 Min",
        "priceRange": "\$40-\$90",
        "whatsIncluded": [
          {"title": "Brake System Inspection", "desc": "Checks brake pads, discs, and fluid levels to ensure safe and responsive braking."},
          {"title": "Tyre Condition Check", "desc": "Examines tread depth, pressure, and overall tyre condition for stability and grip."},
          {"title": "Fluid Level Check", "desc": "Verifies engine oil, brake fluid, and other essential fluids are at correct levels."},
          {"title": "Lights & Safety Check", "desc": "Inspects headlights, indicators, and safety features for proper functionality."},
        ]
      },
      {
        "number": "06",
        "title": "Spark Plug Replacement",
        "desc": "Spark plug replacement ensures proper ignition within your engine, allowing it to start smoothly and run efficiently under all conditions.",
        "imagePath": ImageString.sparkPlug,
        "time": "30-45 Min",
        "priceRange": "\$40-\$90",
        "whatsIncluded": [
          {"title": "Ignition System Check", "desc": "Inspects ignition coils and related components to ensure proper spark delivery."},
          {"title": "Engine Performance Check", "desc": "Verifies smooth engine start and operation after replacement."},
          {"title": "Wiring & Connection Inspection", "desc": "Checks plug wires and connections for wear or damage."},
          {"title": "Professional Installation", "desc": "Ensures correct fitting and torque for reliable and long-lasting performance."},
        ]
      },
    ];

    return Obx(() {
      final service = controller.selectedService.value;

      if (service != null) {
        return _buildDetailsView(context, service, isTiny, controller);
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
              "General Maintenances",
              textAlign: TextAlign.center,
              style: TTextTheme.h1StyleBlack(context),
            ),
            const SizedBox(height: 15),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Text(
                "Keep your vehicle in top condition with routine maintenance services that ensure safety, performance, and long-term reliability.",
                textAlign: TextAlign.center,
                style: TTextTheme.medium16black(context),
              ),
            ),
            const SizedBox(height: 50),
            Wrap(
              spacing: 25,
              runSpacing: 25,
              alignment: WrapAlignment.center,
              children: servicesData.map((data) {
                return _buildMaintenanceCard(
                  context,
                  number: data["number"],
                  title: data["title"],
                  desc: data["desc"],
                  imagePath: data["imagePath"],
                  isTiny: isTiny,
                  onTap: () => controller.selectService(data),
                );
              }).toList(),
            ),
          ],
        ),
      );
    });
  }

   /// ---------- Extra Widget ----------- ///

   // Maintenance Card
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
    final bool isMobile = AppSizes.isMobile(context);

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
      constraints: const BoxConstraints(minWidth: 380),
      padding: EdgeInsets.all(isTiny ? 16 : 30),
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
            height: isMobile ? 120 : 150,
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

   // Detail View
  Widget _buildDetailsView(BuildContext context, Map<String, dynamic> service, bool isTiny, ServicesController controller) {
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
                  "What's Include",
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

//  META INFO WIDGET
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