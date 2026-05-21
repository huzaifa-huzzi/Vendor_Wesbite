import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Vendor/Services/BatteryServices/Widget/BatteryBanner.dart';
import 'package:vendor_website/Vendor/Services/BatteryServices/Widget/BatteryKeyBenefitSection.dart';
import 'package:vendor_website/Vendor/Services/BatteryServices/Widget/BatteryServicesGrid.dart';
import 'package:vendor_website/Vendor/Services/BatteryServices/Widget/ResponsiveVideoBatterySection.dart';
import 'package:vendor_website/Vendor/Services/BatteryServices/Widget/WhyChooseBatteryService.dart';
import 'package:vendor_website/Vendor/Services/Reusable%20Widget/MainFooterWidgetServices.dart';
import 'package:vendor_website/Vendor/Services/Reusable%20Widget/NewsLetterServiceSection.dart';
import 'package:vendor_website/Vendor/Services/ServicesController.dart';





class BatteryServices extends StatelessWidget {
  const BatteryServices({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ServicesController());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WebAppBar(scaffoldKey: scaffoldKey),
            BatteryBanner(),
            SizedBox(height: 50,),
            BatteryServicesGrid(),
            SizedBox(height: 50,),
            BatteryKeyBenefitsSection(),
            SizedBox(height: 30,),
            WhyChooseBatteryService(),
            SizedBox(height: 50,),
            ResponisveVideoBatterySection(),
            SizedBox(height: 50,),
            NewsletterServiceSectionWidget(),
            MainFooterWidetServices(),

          ],
        ),
      ),
    );
  }
}